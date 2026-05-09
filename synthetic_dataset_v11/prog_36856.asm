; DESCRIPTION: Draws a yellow line from (44, 38) to (233, 98).
; PLAN: r0=44(x1), r1=38(y1), r2=233(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 38
LDI r2, 233
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
