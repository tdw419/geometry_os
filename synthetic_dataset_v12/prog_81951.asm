; DESCRIPTION: Composite: Places a red line segment connecting (437, 89) to (184, 50) then Renders a white disk with center (187, 113) and radius 30.
; PLAN: r0=437(x1), r1=89(y1), r2=184(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=113(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 437
LDI r1, 89
LDI r2, 184
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 113
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
