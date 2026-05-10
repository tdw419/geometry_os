; DESCRIPTION: Composite: Places a green dot at position (64, 15) then Draws a green rectangle at (459, 177) with width 27 and height 33.
; PLAN: r0=64(x), r1=15(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=459(x), r6=177(y), r7=27(width), r8=33(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 15
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 459
LDI r6, 177
LDI r7, 27
LDI r8, 33
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
