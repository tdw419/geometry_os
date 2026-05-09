; DESCRIPTION: Draws a green line from (324, 81) to (175, 4).
; PLAN: r0=324(x1), r1=81(y1), r2=175(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 81
LDI r2, 175
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
