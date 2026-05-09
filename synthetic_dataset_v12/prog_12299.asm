; DESCRIPTION: Draws a purple line from (32, 86) to (207, 64).
; PLAN: r0=32(x1), r1=86(y1), r2=207(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 86
LDI r2, 207
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
