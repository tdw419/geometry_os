; DESCRIPTION: Composite: Creates a yellow circular shape at (100, 130) with radius 29 then Renders a green box of size 82x75 starting at (22, 59).
; PLAN: r0=100(x), r1=130(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x), r6=59(y), r7=82(width), r8=75(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 130
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 59
LDI r7, 82
LDI r8, 75
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
