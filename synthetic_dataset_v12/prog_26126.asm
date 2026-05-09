; DESCRIPTION: Draws a yellow line from (8, 12) to (240, 4).
; PLAN: r0=8(x1), r1=12(y1), r2=240(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 12
LDI r2, 240
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
