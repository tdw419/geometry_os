; DESCRIPTION: Draws a yellow line from (166, 25) to (472, 186).
; PLAN: r0=166(x1), r1=25(y1), r2=472(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 25
LDI r2, 472
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
