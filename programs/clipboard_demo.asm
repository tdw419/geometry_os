; clipboard_demo.asm -- Clipboard Protocol Demo
; Demonstrates the clipboard RAM convention:
;   0xF10 = ownership flag (0=free, 1=writing)
;   0xF11 = data length (0-14 u32 words)
;   0xF12-0xF1F = data (up to 14 u32 words)
;
; Protocol: claim -> write data -> write length -> release
; This program writes 5 colors to clipboard then halts.

    ; Draw source pixels on screen to visualize what's being copied
    LDI r10, 10
    LDI r11, 10
    LDI r12, 0xFF0000
    PSET r10, r11, r12        ; red dot at (10,10)

    LDI r10, 12
    LDI r12, 0x00FF00
    PSET r10, r11, r12        ; green dot at (12,10)

    LDI r10, 14
    LDI r12, 0x0000FF
    PSET r10, r11, r12        ; blue dot at (14,10)

    LDI r10, 16
    LDI r12, 0xFFFF00
    PSET r10, r11, r12        ; yellow dot at (16,10)

    LDI r10, 18
    LDI r12, 0xFF00FF
    PSET r10, r11, r12        ; magenta dot at (18,10)

    ; --- Clipboard Write Protocol ---
    ; Step 1: Claim clipboard (set ownership flag)
    LDI r4, 0xF10
    LDI r5, 1
    STORE r4, r5              ; ram[0xF10] = 1 (claimed)

    ; Step 2: Write data words to 0xF12-0xF16
    LDI r4, 0xF12
    LDI r5, 0xFF0000
    STORE r4, r5              ; data[0] = red

    LDI r4, 0xF13
    LDI r5, 0x00FF00
    STORE r4, r5              ; data[1] = green

    LDI r4, 0xF14
    LDI r5, 0x0000FF
    STORE r4, r5              ; data[2] = blue

    LDI r4, 0xF15
    LDI r5, 0xFFFF00
    STORE r4, r5              ; data[3] = yellow

    LDI r4, 0xF16
    LDI r5, 0xFF00FF
    STORE r4, r5              ; data[4] = magenta

    ; Step 3: Write data length
    LDI r4, 0xF11
    LDI r5, 5
    STORE r4, r5              ; ram[0xF11] = 5 (length)

    ; Step 4: Release clipboard
    LDI r4, 0xF10
    LDI r5, 0
    STORE r4, r5              ; ram[0xF10] = 0 (free)

    ; --- Clipboard Read Protocol ---
    ; Verify we can read back what we wrote
    ; (In a real multi-process scenario, a different process would do this)
    LDI r4, 0xF10
    LDI r5, 0
    LOAD r6, r4               ; r6 = ownership flag
    LDI r7, 0
    CMP r6, r7
    BLT r0, skip_read         ; skip if not free (shouldn't happen)

    ; Read length
    LDI r4, 0xF11
    LOAD r8, r4               ; r8 = length (should be 5)

    ; Read first data word and paste it on screen at (10, 20)
    LDI r4, 0xF12
    LOAD r9, r4               ; r9 = data[0] (red)
    LDI r10, 10
    LDI r11, 20
    PSET r10, r11, r9         ; paste red dot

    ; Read second data word
    LDI r4, 0xF13
    LOAD r9, r4               ; r9 = data[1] (green)
    LDI r10, 12
    PSET r10, r11, r9         ; paste green dot

    ; Read third data word
    LDI r4, 0xF14
    LOAD r9, r4               ; r9 = data[2] (blue)
    LDI r10, 14
    PSET r10, r11, r9         ; paste blue dot

    ; Read fourth data word
    LDI r4, 0xF15
    LOAD r9, r4               ; r9 = data[3] (yellow)
    LDI r10, 16
    PSET r10, r11, r9         ; paste yellow dot

    ; Read fifth data word
    LDI r4, 0xF16
    LOAD r9, r4               ; r9 = data[4] (magenta)
    LDI r10, 18
    PSET r10, r11, r9         ; paste magenta dot

skip_read:
    HALT
