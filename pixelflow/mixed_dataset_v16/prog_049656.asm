; DESCRIPTION: Draws a red line from (257, 170) to (424, 109).
; PLAN: r0=257(x1), r1=170(y1), r2=424(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 170
LDI r2, 424
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
