; DESCRIPTION: Composite: Creates a blue circular shape at (268, 40) with radius 17 then Renders a orange box of size 106x48 starting at (95, 35).
; PLAN: r0=268(x), r1=40(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=35(y), r7=106(width), r8=48(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 40
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 35
LDI r7, 106
LDI r8, 48
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
