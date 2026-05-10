; DESCRIPTION: Composite: Places a black line segment connecting (468, 33) to (148, 189) then Places a blue circle of radius 41 at center (443, 82).
; PLAN: r0=468(x1), r1=33(y1), r2=148(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=82(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 468
LDI r1, 33
LDI r2, 148
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 82
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
