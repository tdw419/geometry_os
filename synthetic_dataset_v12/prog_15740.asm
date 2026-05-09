; DESCRIPTION: Renders a orange line between points (475, 173) and (36, 194).
; PLAN: r0=475(x1), r1=173(y1), r2=36(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 173
LDI r2, 36
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
