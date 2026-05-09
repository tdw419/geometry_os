; DESCRIPTION: Renders a orange line between points (321, 228) and (4, 15).
; PLAN: r0=321(x1), r1=228(y1), r2=4(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 228
LDI r2, 4
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
