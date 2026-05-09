; DESCRIPTION: Draws a purple line from (180, 59) to (175, 224).
; PLAN: r0=180(x1), r1=59(y1), r2=175(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 59
LDI r2, 175
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
