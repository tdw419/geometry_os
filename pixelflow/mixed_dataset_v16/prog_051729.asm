; DESCRIPTION: Composite: Renders a black box of size 59x14 starting at (35, 224) then Renders a red disk with center (253, 141) and radius 35.
; PLAN: r0=35(x), r1=224(y), r2=59(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=141(y), r7=35(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 35
LDI r1, 224
LDI r2, 59
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 141
LDI r7, 35
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
