; DESCRIPTION: Composite: Creates a cyan rectangular region at (180, 41) spanning 33 by 106 pixels then Draws a black circle centered at (409, 37) with radius 29.
; PLAN: r0=180(x), r1=41(y), r2=33(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=37(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 41
LDI r2, 33
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 37
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
