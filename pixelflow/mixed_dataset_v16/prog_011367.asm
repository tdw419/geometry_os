; DESCRIPTION: Composite: Draws a yellow circle centered at (357, 100) with radius 73 then Renders a black box of size 51x20 starting at (2, 52).
; PLAN: r0=357(x), r1=100(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=52(y), r7=51(width), r8=20(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 100
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 52
LDI r7, 51
LDI r8, 20
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
