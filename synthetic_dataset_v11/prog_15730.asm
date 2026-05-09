; DESCRIPTION: Draws a yellow line from (240, 58) to (12, 35).
; PLAN: r0=240(x1), r1=58(y1), r2=12(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 58
LDI r2, 12
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
