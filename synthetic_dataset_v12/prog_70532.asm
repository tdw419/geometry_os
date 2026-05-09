; DESCRIPTION: Composite: Renders a purple box of size 22x111 starting at (430, 137) then Creates a green circular shape at (38, 71) with radius 11.
; PLAN: r0=430(x), r1=137(y), r2=22(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=71(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 430
LDI r1, 137
LDI r2, 22
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 71
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
