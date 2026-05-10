; DESCRIPTION: Composite: Sets a single purple pixel at (366, 37) then Creates a yellow circular shape at (340, 31) with radius 31 then Renders a black box of size 21x29 starting at (67, 6).
; PLAN: r0=366(x), r1=37(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=31(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=67(x), r11=6(y), r12=21(width), r13=29(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 37
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 340
LDI r6, 31
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 67
LDI r11, 6
LDI r12, 21
LDI r13, 29
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
