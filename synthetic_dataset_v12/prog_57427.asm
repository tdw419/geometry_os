; DESCRIPTION: Composite: Places a red dot at position (257, 148) then Draws a blue rectangle at (112, 54) with width 40 and height 110.
; PLAN: r0=257(x), r1=148(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=54(y), r7=40(width), r8=110(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 148
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 112
LDI r6, 54
LDI r7, 40
LDI r8, 110
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
