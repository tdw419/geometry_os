; DESCRIPTION: Composite: Draws a black circle centered at (188, 71) with radius 40 then Renders a yellow box of size 73x118 starting at (42, 40).
; PLAN: r0=188(x), r1=71(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=40(y), r7=73(width), r8=118(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 71
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 40
LDI r7, 73
LDI r8, 118
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
