; DESCRIPTION: Renders a black line between points (1, 104) and (443, 3).
; PLAN: r0=1(x1), r1=104(y1), r2=443(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 104
LDI r2, 443
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
