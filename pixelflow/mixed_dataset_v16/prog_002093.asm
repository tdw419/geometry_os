; DESCRIPTION: Composite: Renders a black box of size 28x107 starting at (160, 140) then Draws a purple circle centered at (146, 123) with radius 73.
; PLAN: r0=160(x), r1=140(y), r2=28(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=146(x), r6=123(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 160
LDI r1, 140
LDI r2, 28
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 123
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
