; DESCRIPTION: Composite: Sets a single magenta pixel at (264, 23) then Draws a white rectangle at (144, 102) with width 77 and height 22.
; PLAN: r0=264(x), r1=23(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=102(y), r7=77(width), r8=22(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 23
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 144
LDI r6, 102
LDI r7, 77
LDI r8, 22
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
