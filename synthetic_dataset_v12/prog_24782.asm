; DESCRIPTION: Composite: Creates a yellow circular shape at (391, 155) with radius 49 then Renders a black box of size 36x96 starting at (63, 36).
; PLAN: r0=391(x), r1=155(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=36(y), r7=36(width), r8=96(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 155
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 36
LDI r7, 36
LDI r8, 96
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
