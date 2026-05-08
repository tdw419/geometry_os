; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; pixel_history_demo.asm -- Demonstrates PIXEL_HISTORY (0x84)
; Time-travel debugging: write pixels, then query who wrote to them.
;
; This demo:
; 1. Enables trace recording (SNAP_TRACE mode 1)
; 2. Draws 3 different colored pixels at the same location
; 3. Queries how many times pixel (10,10) was written
; 4. Retrieves the write history and displays each color
; 5. Shows total entries in the log
;
; Controls: Just watch it run -- it's a self-contained demo.

    ; Enable trace recording
    LDI r4, 1
    SNAP_TRACE r4

    ; Draw red pixel at (10, 10)
    LDI r15, 10
    LDI r2, 10
    LDI r11, 0xFF0000
    PSET r15, r2, r11

    ; Draw green pixel at (10, 10) -- overwriting red
    LDI r11, 0x00FF00
    PSET r15, r2, r11

    ; Draw blue pixel at (10, 10) -- overwriting green
    LDI r11, 0x0000FF
    PSET r15, r2, r11

    ; Query: how many writes to pixel (10, 10)?
    LDI r4, 1           ; mode 1 = count at pixel
    LDI r15, 10          ; x
    LDI r2, 10          ; y
    PIXEL_HISTORY r4
    ; r4 = 3 (three writes)

    ; Retrieve the write history into RAM at 0x1000
    LDI r4, 2           ; mode 2 = get recent writes
    LDI r15, 10          ; x
    LDI r2, 10          ; y
    LDI r11, 10          ; max_count
    LDI r0, 0x1000      ; buffer address
    PIXEL_HISTORY r4
    ; r4 = 3 (entries written), RAM[0x1000..0x1011] has the data

    ; Show total entries in log
    LDI r4, 0           ; mode 0 = count total
    PIXEL_HISTORY r4
    ; r4 = 3

    ; Display the history as colored bars on screen
    ; Entry 0 (newest = blue): draw bar at y=20
    LDI r8, 0x1000      ; entry 0 base
    LOAD r14, 12, r8     ; color field (offset 5 in entry)
    LDI r15, 20          ; x
    LDI r2, 20          ; y
    RECTF r15, r2, r11, r2, r14  ; 3x3 colored square

    ; Entry 1 (green): draw bar at y=30
    LDI r8, 0x1006      ; entry 1 base (6 words per entry)
    LOAD r14, 12, r8
    LDI r2, 30
    RECTF r15, r2, r11, r2, r14

    ; Entry 2 (oldest = red): draw bar at y=40
    LDI r8, 0x100C      ; entry 2 base
    LOAD r14, 12, r8
    LDI r2, 40
    RECTF r15, r2, r11, r2, r14

    ; Label
    LDI r15, 50
    LDI r2, 55
    LDI r11, msg
    TEXT r15, r2, r11

    FRAME
    HALT

msg: .ascii "Pixel History: 3 writes"
     .db 0
