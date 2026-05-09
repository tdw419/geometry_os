; DESCRIPTION: Draws a yellow line from (240, 106) to (425, 121).
; PLAN: r0=240(x1), r1=106(y1), r2=425(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 106
LDI r2, 425
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
