; DESCRIPTION: Composite: Places a black dot at position (321, 166) then Draws a blue rectangle at (105, 56) with width 116 and height 31.
; PLAN: r0=321(x), r1=166(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=56(y), r7=116(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 166
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 105
LDI r6, 56
LDI r7, 116
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
