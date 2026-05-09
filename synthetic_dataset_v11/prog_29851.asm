; DESCRIPTION: Renders a orange line between points (123, 106) and (182, 173).
; PLAN: r0=123(x1), r1=106(y1), r2=182(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 106
LDI r2, 182
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
