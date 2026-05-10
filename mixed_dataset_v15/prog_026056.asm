; DESCRIPTION: Composite: Places a green line segment connecting (246, 211) to (148, 250) then Places a red circle of radius 28 at center (430, 64).
; PLAN: r0=246(x1), r1=211(y1), r2=148(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=64(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 246
LDI r1, 211
LDI r2, 148
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 64
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
