; DESCRIPTION: Composite: Places a orange 77x22 rectangle at position (105, 71) then Draws a orange circle centered at (388, 71) with radius 53.
; PLAN: r0=105(x), r1=71(y), r2=77(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=71(y), r7=53(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 71
LDI r2, 77
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 71
LDI r7, 53
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
