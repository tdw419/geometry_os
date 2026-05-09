; DESCRIPTION: Renders a orange line between points (214, 32) and (134, 179).
; PLAN: r0=214(x1), r1=32(y1), r2=134(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 32
LDI r2, 134
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
