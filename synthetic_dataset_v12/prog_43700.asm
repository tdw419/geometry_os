; DESCRIPTION: Renders a black line between points (438, 234) and (450, 48).
; PLAN: r0=438(x1), r1=234(y1), r2=450(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 234
LDI r2, 450
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
