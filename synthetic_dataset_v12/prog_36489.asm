; DESCRIPTION: Composite: Places a red circle of radius 28 at center (200, 201) then Renders a white box of size 65x72 starting at (109, 10) then Sets a single green pixel at (260, 188).
; PLAN: r0=200(x), r1=201(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=10(y), r7=65(width), r8=72(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x), r11=188(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 201
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 10
LDI r7, 65
LDI r8, 72
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 188
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
