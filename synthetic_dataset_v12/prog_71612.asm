; DESCRIPTION: Draws a red line from (496, 109) to (23, 6).
; PLAN: r0=496(x1), r1=109(y1), r2=23(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 109
LDI r2, 23
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
