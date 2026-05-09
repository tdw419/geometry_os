; DESCRIPTION: Renders a orange line between points (170, 234) and (446, 193).
; PLAN: r0=170(x1), r1=234(y1), r2=446(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 234
LDI r2, 446
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
