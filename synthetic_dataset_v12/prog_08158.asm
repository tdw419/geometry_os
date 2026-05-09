; DESCRIPTION: Draws a orange line from (264, 179) to (111, 102).
; PLAN: r0=264(x1), r1=179(y1), r2=111(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 179
LDI r2, 111
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
