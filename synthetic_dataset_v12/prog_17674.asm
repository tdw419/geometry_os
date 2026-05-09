; DESCRIPTION: Places a black line segment connecting (71, 193) to (443, 2).
; PLAN: r0=71(x1), r1=193(y1), r2=443(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 193
LDI r2, 443
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
