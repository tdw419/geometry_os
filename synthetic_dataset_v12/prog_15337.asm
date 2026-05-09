; DESCRIPTION: Composite: Sets a single black pixel at (379, 160) then Renders a green box of size 30x38 starting at (360, 179) then Renders a red disk with center (205, 87) and radius 72.
; PLAN: r0=379(x), r1=160(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=179(y), r7=30(width), r8=38(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x), r11=87(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 379
LDI r1, 160
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 360
LDI r6, 179
LDI r7, 30
LDI r8, 38
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 87
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
