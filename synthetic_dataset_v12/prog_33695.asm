; DESCRIPTION: Draws a yellow line from (240, 164) to (253, 205).
; PLAN: r0=240(x1), r1=164(y1), r2=253(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 164
LDI r2, 253
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
