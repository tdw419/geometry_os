; DESCRIPTION: Draws a yellow line from (240, 69) to (253, 35).
; PLAN: r0=240(x1), r1=69(y1), r2=253(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 69
LDI r2, 253
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
