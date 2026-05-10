; DESCRIPTION: Composite: Sets a single orange pixel at (238, 91) then Draws a white rectangle at (183, 136) with width 67 and height 63.
; PLAN: r0=238(x), r1=91(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=136(y), r7=67(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 91
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 183
LDI r6, 136
LDI r7, 67
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
