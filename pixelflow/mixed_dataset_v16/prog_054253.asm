; DESCRIPTION: Composite: Renders a white box of size 108x60 starting at (86, 60) then Draws a white circle centered at (160, 18) with radius 18.
; PLAN: r0=86(x), r1=60(y), r2=108(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x), r6=18(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 86
LDI r1, 60
LDI r2, 108
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 18
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
