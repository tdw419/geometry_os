; DESCRIPTION: Composite: Sets a single purple pixel at (196, 218) then Draws a blue rectangle at (178, 106) with width 64 and height 114.
; PLAN: r0=196(x), r1=218(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=106(y), r7=64(width), r8=114(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 218
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 178
LDI r6, 106
LDI r7, 64
LDI r8, 114
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
