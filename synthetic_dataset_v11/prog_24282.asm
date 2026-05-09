; DESCRIPTION: Renders a black line between points (234, 30) and (254, 243).
; PLAN: r0=234(x1), r1=30(y1), r2=254(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 30
LDI r2, 254
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
