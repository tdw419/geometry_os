; DESCRIPTION: Composite: Creates a blue circular shape at (316, 102) with radius 51 then Places a blue line segment connecting (458, 184) to (88, 41) then Places a green dot at position (299, 10).
; PLAN: r0=316(x), r1=102(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=458(x1), r6=184(y1), r7=88(x2), r8=41(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=10(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 316
LDI r1, 102
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 458
LDI r6, 184
LDI r7, 88
LDI r8, 41
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 10
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
