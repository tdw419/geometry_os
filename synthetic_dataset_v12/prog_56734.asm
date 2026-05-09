; DESCRIPTION: Composite: Renders a purple box of size 46x104 starting at (341, 21) then Creates a green circular shape at (192, 63) with radius 47.
; PLAN: r0=341(x), r1=21(y), r2=46(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=63(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 21
LDI r2, 46
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 63
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
