; DESCRIPTION: Geometry OS program to draw a red object.

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
    LDI r11, 1
    SNAP_TRACE r11

    ; Draw red pixel at (10, 10)
    LDI r8, 10
    LDI r15, 10
    LDI r6, 0xFF0000
    PSET r8, r15, r6

    ; Draw green pixel at (10, 10) -- overwriting red
    LDI r6, 0x00FF00
    PSET r8, r15, r6

    ; Draw blue pixel at (10, 10) -- overwriting green
    LDI r6, 0x0000FF
    PSET r8, r15, r6

    ; Query: how many writes to pixel (10, 10)?
    LDI r11, 1           ; mode 1 = count at pixel
    LDI r8, 10          ; x
    LDI r15, 10          ; y
    PIXEL_HISTORY r11
    ; r11 = 3 (three writes)

    ; Retrieve the write history into RAM at 0x1000
    LDI r11, 2           ; mode 2 = get recent writes
    LDI r8, 10          ; x
    LDI r15, 10          ; y
    LDI r6, 10          ; max_count
    LDI r3, 0x1000      ; buffer address
    PIXEL_HISTORY r11
    ; r11 = 3 (entries written), RAM[0x1000..0x1011] has the data

    ; Show total entries in log
    LDI r11, 0           ; mode 0 = count total
    PIXEL_HISTORY r11
    ; r11 = 3

    ; Display the history as colored bars on screen
    ; Entry 0 (newest = blue): draw bar at y=20
    LDI r0, 0x1000      ; entry 0 base
    LOAD r7, 12, r0     ; color field (offset 5 in entry)
    LDI r8, 20          ; x
    LDI r15, 20          ; y
    RECTF r8, r15, r6, r15, r7  ; 3x3 colored square

    ; Entry 1 (green): draw bar at y=30
    LDI r0, 0x1006      ; entry 1 base (6 words per entry)
    LOAD r7, 12, r0
    LDI r15, 30
    RECTF r8, r15, r6, r15, r7

    ; Entry 2 (oldest = red): draw bar at y=40
    LDI r0, 0x100C      ; entry 2 base
    LOAD r7, 12, r0
    LDI r15, 40
    RECTF r8, r15, r6, r15, r7

    ; Label
    LDI r8, 50
    LDI r15, 55
    LDI r6, msg
    TEXT r8, r15, r6

    FRAME
    HALT

msg: .ascii "Pixel History: 3 writes"
     .db 0
