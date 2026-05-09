; DESCRIPTION: Renders a orange line between points (345, 163) and (447, 167).
; PLAN: r0=345(x1), r1=163(y1), r2=447(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 163
LDI r2, 447
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
