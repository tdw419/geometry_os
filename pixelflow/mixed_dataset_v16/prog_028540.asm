; DESCRIPTION: Composite: Places a red line segment connecting (50, 224) to (389, 115) then Places a red circle of radius 20 at center (60, 110).
; PLAN: r0=50(x1), r1=224(y1), r2=389(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=110(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 50
LDI r1, 224
LDI r2, 389
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 110
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
