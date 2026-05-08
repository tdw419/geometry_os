; DESCRIPTION: This GeOS assembly code implements a settings panel for theme selection, volume control, and configuration display. It uses RECTF to draw panels, DRAWTEXT for colored text rendering, and IKEY for input handling. The RAM layout manages the current theme ID, volume level, cursor position, key repeat speed, and a scratch buffer for text operations. The code supports navigation using W/S (up/down) to move the selection cursor and A/D/Enter to change settings values, with Escape exiting the panel.

; settings.asm -- Settings Panel for Geometry OS
; Phase 77: Theme selection, volume control, config display
;
; Proves: RECTF panels, DRAWTEXT colored text, IKEY input,
;         RAM-based config state, visual UI with selection cursor.
;
; Controls:
;   Up/Down arrow (W/S) to move cursor
;   Left/Right arrow (A/D) or Enter to change value
;   Escape (key 27) to exit
;
; RAM Layout:
;   0x6900  theme_id (0-7, selects color palette)
;   0x6904  volume (0-100, beep volume level)
;   0x6908  cursor_pos (0-2, which setting is selected)
;   0x690C  key_repeat (1-5, key repeat speed)
;   0x6910  scratch buffer for text rendering
;
; NOTE: No colons in comments (assembler pitfall)

#define THEME    0x6900
#define VOLUME   0x6904
#define CURSOR   0x6908
#define KEYREPT  0x690C
#define SCRATCH  0x6910
#define TICKS    0xFFE

; 8 theme palettes (bg, fg, accent, panel)
; Stored as 4 consecutive u32 per theme at 0x7000
#define THEMES   0x7000

; =========================================
; INIT
; =========================================
start:
    LDI r30, 0xFD00

    ; Init defaults
    LDI r20, THEME
    LDI r21, 0
    STORE r20, r21

    LDI r20, VOLUME
    LDI r21, 50
    STORE r20, r21

    LDI r20, CURSOR
    LDI r21, 0
    STORE r20, r21

    LDI r20, KEYREPT
    LDI r21, 3
    STORE r20, r21

    ; Build theme table at THEMES
    ; Theme 0: Dark (navy bg, white fg, cyan accent, dark panel)
    LDI r20, THEMES
    LDI r21, 0x0D1B2A
    STORE r20, r21          ; bg
    ADDI r20, 1
    LDI r21, 0xE0E0E0
    STORE r20, r21          ; fg
    ADDI r20, 1
    LDI r21, 0x00B4D8
    STORE r20, r21          ; accent
    ADDI r20, 1
    LDI r21, 0x1B2838
    STORE r20, r21          ; panel

    ; Theme 1: Ocean
    ADDI r20, 1
    LDI r21, 0x0A1628
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x90E0EF
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x0077B6
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x142838
    STORE r20, r21

    ; Theme 2: Forest
    ADDI r20, 1
    LDI r21, 0x0A1A0A
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xA0D8A0
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x2D6A2D
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x142814
    STORE r20, r21

    ; Theme 3: Sunset
    ADDI r20, 1
    LDI r21, 0x1A0A14
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xFFD6A0
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xE06040
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x281420
    STORE r20, r21

    ; Theme 4: Monochrome
    ADDI r20, 1
    LDI r21, 0x141414
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xC0C0C0
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x808080
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x202020
    STORE r20, r21

    ; Theme 5: Vaporwave
    ADDI r20, 1
    LDI r21, 0x1A0A2A
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xFF71CE
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x01CDFE
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x200A30
    STORE r20, r21

    ; Theme 6: Amber
    ADDI r20, 1
    LDI r21, 0x1A1400
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xFFB000
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xFF8800
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x282000
    STORE r20, r21

    ; Theme 7: Matrix
    ADDI r20, 1
    LDI r21, 0x000A00
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x00FF00
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x00CC00
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x001400
    STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    IKEY r25
    JNZ r25, handle_key

    ; Load current theme
    LDI r20, THEME
    LOAD r22, r20
    SHLI r22, 2             ; theme * 4 words
    LDI r21, THEMES
    ADD r21, r22            ; ptr to theme colors

    LOAD r15, r21           ; bg color
    ADDI r21, 1
    LOAD r16, r21           ; fg color
    ADDI r21, 1
    LOAD r17, r21           ; accent color
    ADDI r21, 1
    LOAD r18, r21           ; panel color

    ; Clear with bg
    FILL r15

    ; ── Title bar ──
    LDI r2, 0
    LDI r3, 0
    LDI r7, 256
    LDI r11, 24
    RECTF r2, r3, r7, r11, r17

    ; Title text
    LDI r20, SCRATCH
    STRO r20, "SETTINGS"
    LDI r2, 0
    LDI r3, 6
    LDI r7, SCRATCH
    LDI r11, 0             ; fg=black on accent
    LDI r9, 0
    DRAWTEXT r2, r3, r7, r11, r9

    ; ── Settings Panel ──
    ; Panel background
    LDI r2, 16
    LDI r3, 32
    LDI r7, 224
    LDI r11, 192
    RECTF r2, r3, r7, r11, r18

    ; Load cursor position
    LDI r20, CURSOR
    LOAD r23, r20

    ; ── Draw Theme option (row 0) ──
    LDI r2, 24
    LDI r3, 44
    CMPI r23, 0
    JNZ r8, not_sel0
    ; Highlight selected row
    LDI r2, 17
    LDI r3, 40
    LDI r7, 222
    LDI r11, 28
    RECTF r2, r3, r7, r11, r17
    LDI r2, 24
    LDI r3, 44
not_sel0:
    LDI r20, SCRATCH
    STRO r20, "Theme"
    LDI r2, 24
    LDI r3, 44
    LDI r7, SCRATCH
    DRAWTEXT r2, r3, r7, r16, r15

    ; Theme value (0-7)
    LDI r20, THEME
    LOAD r22, r20
    LDI r20, SCRATCH
    ; Convert number to string at scratch+10
    ADDI r20, 10
    LDI r21, 48             ; ASCII '0'
    ADD r21, r22
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0
    STORE r20, r21          ; null terminator
    LDI r2, 140
    LDI r3, 44
    LDI r7, SCRATCH
    ADDI r7, 10
    LDI r11, 0xFFAA00       ; gold for value
    DRAWTEXT r2, r3, r7, r11, r15

    ; Theme name
    LDI r20, THEME
    LOAD r22, r20
    LDI r20, SCRATCH
    ADDI r20, 20
    ; Dispatch on theme id
    CMPI r22, 0
    JNZ r8, tnot0
    STRO r20, "Dark"
    JMP tname_done
tnot0:
    CMPI r22, 1
    JNZ r8, tnot1
    STRO r20, "Ocean"
    JMP tname_done
tnot1:
    CMPI r22, 2
    JNZ r8, tnot2
    STRO r20, "Forest"
    JMP tname_done
tnot2:
    CMPI r22, 3
    JNZ r8, tnot3
    STRO r20, "Sunset"
    JMP tname_done
tnot3:
    CMPI r22, 4
    JNZ r8, tnot4
    STRO r20, "Mono"
    JMP tname_done
tnot4:
    CMPI r22, 5
    JNZ r8, tnot5
    STRO r20, "Vaporwave"
    JMP tname_done
tnot5:
    CMPI r22, 6
    JNZ r8, tnot6
    STRO r20, "Amber"
    JMP tname_done
tnot6:
    STRO r20, "Matrix"
tname_done:
    LDI r2, 160
    LDI r3, 44
    LDI r7, SCRATCH
    ADDI r7, 20
    LDI r11, 0x808080
    DRAWTEXT r2, r3, r7, r11, r15

    ; ── Draw Volume option (row 1) ──
    LDI r2, 24
    LDI r3, 84
    CMPI r23, 1
    JNZ r8, not_sel1
    LDI r2, 17
    LDI r3, 80
    LDI r7, 222
    LDI r11, 28
    RECTF r2, r3, r7, r11, r17
    LDI r2, 24
    LDI r3, 84
not_sel1:
    LDI r20, SCRATCH
    STRO r20, "Volume"
    LDI r2, 24
    LDI r3, 84
    LDI r7, SCRATCH
    DRAWTEXT r2, r3, r7, r16, r15

    ; Volume bar
    LDI r20, VOLUME
    LOAD r22, r20
    ; Bar background
    LDI r2, 140
    LDI r3, 86
    LDI r7, 80
    LDI r11, 12
    LDI r9, 0x303030
    RECTF r2, r3, r7, r11, r9
    ; Bar fill (volume / 100 * 80)
    LDI r9, 80
    MUL r22, r9
    LDI r9, 100
    DIV r22, r9            ; fill_width = vol * 80 / 100
    LDI r2, 140
    LDI r3, 86
    LDI r11, 12
    RECTF r2, r3, r22, r11, r17

    ; Volume number
    LDI r20, VOLUME
    LOAD r22, r20
    LDI r20, SCRATCH
    ADDI r20, 30
    LDI r21, 48
    ; tens digit
    LDI r9, 10
    DIV r22, r9
    ADD r21, r22
    STORE r20, r21
    ADDI r20, 1
    ; ones digit
    LDI r21, 48
    LDI r22, VOLUME
    LOAD r22, r22
    LDI r9, 10
    MOD r22, r9
    ADD r21, r22
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0
    STORE r20, r21
    LDI r2, 226
    LDI r3, 84
    LDI r7, SCRATCH
    ADDI r7, 30
    LDI r11, 0xFFAA00
    DRAWTEXT r2, r3, r7, r11, r15

    ; ── Draw Key Repeat option (row 2) ──
    LDI r2, 24
    LDI r3, 124
    CMPI r23, 2
    JNZ r8, not_sel2
    LDI r2, 17
    LDI r3, 120
    LDI r7, 222
    LDI r11, 28
    RECTF r2, r3, r7, r11, r17
    LDI r2, 24
    LDI r3, 124
not_sel2:
    LDI r20, SCRATCH
    STRO r20, "Key Repeat"
    LDI r2, 24
    LDI r3, 124
    LDI r7, SCRATCH
    DRAWTEXT r2, r3, r7, r16, r15

    ; Key repeat dots (1-5)
    LDI r20, KEYREPT
    LOAD r22, r20
    ; Draw N filled dots
    LDI r2, 140
    LDI r3, 128
    LDI r9, 0
repeat_dots:
    CMP r9, r22
    BGE r8, dots_done
    LDI r7, 10
    LDI r11, 10
    RECTF r2, r3, r7, r11, r17
    ADDI r2, 14
    ADDI r9, 1
    JMP repeat_dots
dots_done:
    ; Draw (5-N) empty dots
    LDI r9, 0
empty_dots:
    CMP r9, r22
    BLT r8, skip_dot
    LDI r7, 10
    LDI r11, 10
    RECTF r2, r3, r7, r11, r9
    ; Use panel bg for empty dots
    RECTF r2, r3, r7, r11, r18
    ADDI r2, 14
skip_dot:
    ADDI r9, 1
    LDI r15, 5
    CMP r9, r15
    BLT r8, empty_dots

    ; Reload theme colors (r15-r18 were clobbered)
    LDI r20, THEME
    LOAD r22, r20
    SHLI r22, 2
    LDI r21, THEMES
    ADD r21, r22
    LOAD r15, r21
    ADDI r21, 1
    LOAD r16, r21
    ADDI r21, 1
    LOAD r17, r21
    ADDI r21, 1
    LOAD r18, r21

    ; ── Preview swatch ──
    LDI r2, 24
    LDI r3, 164
    LDI r7, 208
    LDI r11, 48
    RECTF r2, r3, r7, r11, r18

    ; Draw 4 small color swatches
    LDI r2, 32
    LDI r3, 170
    LDI r7, 40
    LDI r11, 36
    RECTF r2, r3, r7, r11, r15  ; bg
    ADDI r2, 48
    RECTF r2, r3, r7, r11, r16  ; fg
    ADDI r2, 48
    RECTF r2, r3, r7, r11, r17  ; accent
    ADDI r2, 48
    RECTF r2, r3, r7, r11, r18  ; panel

    ; Swatch labels
    LDI r20, SCRATCH
    STRO r20, "BG   FG   ACC  PAN"
    LDI r2, 32
    LDI r3, 210
    LDI r7, SCRATCH
    DRAWTEXT r2, r3, r7, r16, r15

    ; ── Help text at bottom ──
    LDI r2, 0
    LDI r3, 236
    LDI r7, 256
    LDI r11, 20
    RECTF r2, r3, r7, r11, r17
    LDI r20, SCRATCH
    STRO r20, "W/S Move  A/D Change  Esc Exit"
    LDI r2, 16
    LDI r3, 240
    LDI r7, SCRATCH
    LDI r11, 0             ; black on accent
    LDI r9, 0
    DRAWTEXT r2, r3, r7, r11, r9

    FRAME
    JMP main_loop

; ── Key handler ───────────────────────────────
handle_key:
    ; W = 87 (up), S = 83 (down)
    ; A = 65 (left/decrease), D = 68 (right/increase)
    ; Enter = 13, Escape = 27

    ; Escape
    CMPI r25, 27
    JNZ r8, not_esc
    HALT
not_esc:

    ; W (up)
    CMPI r25, 87
    JNZ r8, not_up
    LDI r20, CURSOR
    LOAD r22, r20
    JZ r22, main_loop       ; already at top
    SUBI r22, 1
    STORE r20, r22
    JMP main_loop
not_up:

    ; S (down)
    CMPI r25, 83
    JNZ r8, not_down
    LDI r20, CURSOR
    LOAD r22, r20
    CMPI r22, 2
    BGE r8, main_loop       ; already at bottom
    ADDI r22, 1
    STORE r20, r22
    JMP main_loop
not_down:

    ; A (left/decrease) or D (right/increase)
    LDI r26, 0              ; 0=decrease, 1=increase
    CMPI r25, 68
    JNZ r8, check_left
    LDI r26, 1
    JMP do_change
check_left:
    CMPI r25, 65
    JNZ r8, check_enter
    LDI r26, 0
    JMP do_change
check_enter:
    ; Enter = toggle/change based on cursor
    CMPI r25, 13
    JNZ r8, key_done
    LDI r26, 1
    ; Fall through to do_change

do_change:
    LDI r20, CURSOR
    LOAD r23, r20

    ; Cursor 0: theme (0-7)
    CMPI r23, 0
    JNZ r8, not_theme
    LDI r20, THEME
    LOAD r22, r20
    CMPI r26, 1
    JNZ r8, theme_dec
    ADDI r22, 1
    CMPI r22, 8
    BLT r8, theme_store
    LDI r22, 0
    JMP theme_store
theme_dec:
    JZ r22, theme_store     ; skip if already 0
    SUBI r22, 1
theme_store:
    STORE r20, r22
    JMP main_loop
not_theme:

    ; Cursor 1: volume (0-100)
    CMPI r23, 1
    JNZ r8, not_volume
    LDI r20, VOLUME
    LOAD r22, r20
    CMPI r26, 1
    JNZ r8, vol_dec
    ADDI r22, 10
    CMPI r22, 100
    BLT r8, vol_store
    LDI r22, 100
    JMP vol_store
vol_dec:
    JZ r22, vol_store
    SUBI r22, 10
vol_store:
    STORE r20, r22
    JMP main_loop
not_volume:

    ; Cursor 2: key repeat (1-5)
    LDI r20, KEYREPT
    LOAD r22, r20
    CMPI r26, 1
    JNZ r8, kr_dec
    ADDI r22, 1
    CMPI r22, 6
    BLT r8, kr_store
    LDI r22, 5
    JMP kr_store
kr_dec:
    CMPI r22, 2
    BLT r8, kr_store
    SUBI r22, 1
kr_store:
    STORE r20, r22
    JMP main_loop

key_done:
    JMP main_loop
