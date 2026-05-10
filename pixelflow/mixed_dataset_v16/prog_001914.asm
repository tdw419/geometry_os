; DESCRIPTION: Composite: Sets a single magenta pixel at (27, 187) then Renders a black line between points (507, 5) and (32, 255) then Creates a white circular shape at (192, 122) with radius 27.
; PLAN: r0=27(x), r1=187(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=507(x1), r6=5(y1), r7=32(x2), r8=255(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=192(x), r11=122(y), r12=27(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 27
LDI r1, 187
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 507
LDI r6, 5
LDI r7, 32
LDI r8, 255
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 122
LDI r12, 27
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
