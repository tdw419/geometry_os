; DESCRIPTION: Draws a yellow line from (74, 184) to (303, 39).
; PLAN: r0=74(x1), r1=184(y1), r2=303(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 184
LDI r2, 303
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
