; DESCRIPTION: Composite: Places a blue dot at position (332, 78) then Draws a orange rectangle at (340, 149) with width 103 and height 103.
; PLAN: r0=332(x), r1=78(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=149(y), r7=103(width), r8=103(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 78
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 340
LDI r6, 149
LDI r7, 103
LDI r8, 103
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
