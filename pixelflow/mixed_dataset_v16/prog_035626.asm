; DESCRIPTION: Composite: Places a orange 34x33 rectangle at position (282, 31) then Draws a cyan circle centered at (175, 138) with radius 80.
; PLAN: r0=282(x), r1=31(y), r2=34(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x), r6=138(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 282
LDI r1, 31
LDI r2, 34
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 138
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
