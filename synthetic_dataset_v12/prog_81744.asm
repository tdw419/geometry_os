; DESCRIPTION: Renders a orange line between points (412, 163) and (328, 183).
; PLAN: r0=412(x1), r1=163(y1), r2=328(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 163
LDI r2, 328
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
