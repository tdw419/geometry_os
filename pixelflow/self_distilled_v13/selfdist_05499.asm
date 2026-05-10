; DESCRIPTION: Draws a yellow line from (274, 3) to (45, 102).
; PLAN: r0=274(x1), r1=3(y1), r2=45(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 3
LDI r2, 45
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
