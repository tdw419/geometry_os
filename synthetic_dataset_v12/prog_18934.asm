; DESCRIPTION: Composite: Places a orange dot at position (455, 111) then Draws a purple rectangle at (110, 163) with width 92 and height 76.
; PLAN: r0=455(x), r1=111(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=163(y), r7=92(width), r8=76(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 111
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 110
LDI r6, 163
LDI r7, 92
LDI r8, 76
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
