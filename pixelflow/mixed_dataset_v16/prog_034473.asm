; DESCRIPTION: Composite: Places a green circle of radius 47 at center (86, 167) then Places a black line segment connecting (492, 41) to (93, 169).
; PLAN: r0=86(x), r1=167(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x1), r6=41(y1), r7=93(x2), r8=169(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 167
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 41
LDI r7, 93
LDI r8, 169
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
