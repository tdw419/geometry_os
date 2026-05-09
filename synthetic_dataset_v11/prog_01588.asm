; DESCRIPTION: Renders a orange line between points (164, 100) and (22, 195).
; PLAN: r0=164(x1), r1=100(y1), r2=22(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 100
LDI r2, 22
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
