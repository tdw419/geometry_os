; DESCRIPTION: Composite: Renders a orange box of size 106x43 starting at (406, 178) then Creates a green circular shape at (52, 164) with radius 24.
; PLAN: r0=406(x), r1=178(y), r2=106(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=164(y), r7=24(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 178
LDI r2, 106
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 164
LDI r7, 24
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
