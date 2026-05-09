; DESCRIPTION: Composite: Places a white dot at position (312, 150) then Draws a black rectangle at (124, 23) with width 78 and height 119.
; PLAN: r0=312(x), r1=150(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=23(y), r7=78(width), r8=119(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 150
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 23
LDI r7, 78
LDI r8, 119
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
