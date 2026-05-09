; DESCRIPTION: Composite: Sets a single orange pixel at (260, 78) then Renders a yellow box of size 74x98 starting at (277, 25) then Renders a black disk with center (396, 164) and radius 74.
; PLAN: r0=260(x), r1=78(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=25(y), r7=74(width), r8=98(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=396(x), r11=164(y), r12=74(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 260
LDI r1, 78
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 277
LDI r6, 25
LDI r7, 74
LDI r8, 98
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 164
LDI r12, 74
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
