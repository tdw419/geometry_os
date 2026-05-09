; DESCRIPTION: Renders a orange line between points (394, 10) and (220, 193).
; PLAN: r0=394(x1), r1=10(y1), r2=220(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 10
LDI r2, 220
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
