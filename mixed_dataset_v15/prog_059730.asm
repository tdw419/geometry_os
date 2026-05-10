; DESCRIPTION: Composite: Creates a black circular shape at (145, 157) with radius 71 then Places a cyan line segment connecting (60, 162) to (400, 188).
; PLAN: r0=145(x), r1=157(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x1), r6=162(y1), r7=400(x2), r8=188(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 157
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 162
LDI r7, 400
LDI r8, 188
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
