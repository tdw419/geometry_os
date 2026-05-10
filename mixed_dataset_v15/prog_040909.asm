; DESCRIPTION: Composite: Renders a magenta box of size 92x68 starting at (345, 29) then Creates a yellow circular shape at (275, 183) with radius 19.
; PLAN: r0=345(x), r1=29(y), r2=92(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=183(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 29
LDI r2, 92
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 183
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
