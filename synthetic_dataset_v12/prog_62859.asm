; DESCRIPTION: Composite: Sets a single yellow pixel at (388, 32) then Draws a blue rectangle at (463, 29) with width 29 and height 77.
; PLAN: r0=388(x), r1=32(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=463(x), r6=29(y), r7=29(width), r8=77(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 32
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 463
LDI r6, 29
LDI r7, 29
LDI r8, 77
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
