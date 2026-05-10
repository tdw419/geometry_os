; DESCRIPTION: Composite: Places a white circle of radius 60 at center (162, 191) then Places a cyan line segment connecting (199, 45) to (62, 232).
; PLAN: r0=162(x), r1=191(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x1), r6=45(y1), r7=62(x2), r8=232(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 191
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 45
LDI r7, 62
LDI r8, 232
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
