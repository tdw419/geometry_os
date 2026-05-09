; DESCRIPTION: Renders a orange line between points (343, 173) and (302, 160).
; PLAN: r0=343(x1), r1=173(y1), r2=302(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 173
LDI r2, 302
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
