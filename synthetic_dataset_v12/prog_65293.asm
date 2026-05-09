; DESCRIPTION: Draws a yellow line from (414, 102) to (297, 55).
; PLAN: r0=414(x1), r1=102(y1), r2=297(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 102
LDI r2, 297
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
