; DESCRIPTION: Renders a orange line between points (224, 234) and (121, 189).
; PLAN: r0=224(x1), r1=234(y1), r2=121(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 234
LDI r2, 121
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
