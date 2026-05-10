; DESCRIPTION: Composite: Creates a black circular shape at (474, 124) with radius 16 then Renders a red line between points (64, 176) and (309, 207) then Sets a single magenta pixel at (472, 224).
; PLAN: r0=474(x), r1=124(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x1), r6=176(y1), r7=309(x2), r8=207(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=472(x), r11=224(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 474
LDI r1, 124
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 176
LDI r7, 309
LDI r8, 207
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 224
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
