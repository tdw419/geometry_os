; DESCRIPTION: Renders a black line between points (299, 70) and (254, 188).
; PLAN: r0=299(x1), r1=70(y1), r2=254(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 70
LDI r2, 254
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
