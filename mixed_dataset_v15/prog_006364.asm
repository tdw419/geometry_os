; DESCRIPTION: Composite: Places a orange 52x21 rectangle at position (393, 142) then Places a yellow dot at position (2, 74) then Creates a yellow circular shape at (94, 35) with radius 20.
; PLAN: r0=393(x), r1=142(y), r2=52(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x), r6=74(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=94(x), r11=35(y), r12=20(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 142
LDI r2, 52
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 74
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 94
LDI r11, 35
LDI r12, 20
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
