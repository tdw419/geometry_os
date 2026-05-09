; DESCRIPTION: Composite: Sets a single red pixel at (62, 242) then Renders a purple disk with center (385, 100) and radius 62 then Renders a black box of size 16x54 starting at (483, 110).
; PLAN: r0=62(x), r1=242(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=100(y), r7=62(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=483(x), r11=110(y), r12=16(width), r13=54(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 242
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 385
LDI r6, 100
LDI r7, 62
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 483
LDI r11, 110
LDI r12, 16
LDI r13, 54
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
