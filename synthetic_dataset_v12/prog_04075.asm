; DESCRIPTION: Renders a orange line between points (72, 168) and (265, 193).
; PLAN: r0=72(x1), r1=168(y1), r2=265(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 168
LDI r2, 265
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
