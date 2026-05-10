; DESCRIPTION: Composite: Places a white dot at position (337, 224) then Places a yellow line segment connecting (363, 1) to (410, 76) then Places a black circle of radius 63 at center (249, 96).
; PLAN: r0=337(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=363(x1), r6=1(y1), r7=410(x2), r8=76(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=249(x), r11=96(y), r12=63(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 1
LDI r7, 410
LDI r8, 76
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 96
LDI r12, 63
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
