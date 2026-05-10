; DESCRIPTION: Renders a orange line between points (76, 25) and (487, 193).
; PLAN: r0=76(x1), r1=25(y1), r2=487(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 25
LDI r2, 487
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
