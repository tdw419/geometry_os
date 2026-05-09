; 017_smiley_face.asm -- yellow smiley face with circle and line features
; Face: large yellow circle, eyes: small black circles, mouth: line arc

; --- Face ---
LDI r0, 128         ; cx
LDI r1, 128         ; cy
LDI r2, 80          ; radius
LDI r3, 0xFFFF00    ; yellow
CIRCLE r0, r1, r2, r3

; --- Left Eye ---
LDI r0, 100         ; cx
LDI r1, 105         ; cy
LDI r2, 10          ; radius
LDI r3, 0x000000    ; black
CIRCLE r0, r1, r2, r3

; --- Right Eye ---
LDI r0, 156         ; cx
LDI r1, 105         ; cy
CIRCLE r0, r1, r2, r3

; --- Smile (arc approximated with line segments) ---
LDI r4, 0x000000    ; mouth color (black)

; point 1: (96, 148)
LDI r0, 96
LDI r1, 148
; point 2: (108, 160)
LDI r2, 108
LDI r3, 160
LINE r0, r1, r2, r3, r4

; point 3: (120, 166)
LDI r0, 108
LDI r1, 160
LDI r2, 120
LDI r3, 166
LINE r0, r1, r2, r3, r4

; point 4: (136, 166)
LDI r0, 120
LDI r1, 166
LDI r2, 136
LDI r3, 166
LINE r0, r1, r2, r3, r4

; point 5: (148, 160)
LDI r0, 136
LDI r1, 166
LDI r2, 148
LDI r3, 160
LINE r0, r1, r2, r3, r4

; point 6: (160, 148)
LDI r0, 148
LDI r1, 160
LDI r2, 160
LDI r3, 148
LINE r0, r1, r2, r3, r4

HALT
