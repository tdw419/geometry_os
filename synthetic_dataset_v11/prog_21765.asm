; DESCRIPTION: Renders a orange line between points (23, 247) and (7, 173).
; PLAN: r0=23(x1), r1=247(y1), r2=7(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 247
LDI r2, 7
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
