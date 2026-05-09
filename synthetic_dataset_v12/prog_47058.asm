; DESCRIPTION: Composite: Places a magenta dot at position (76, 165) then Draws a cyan rectangle at (469, 159) with width 27 and height 29.
; PLAN: r0=76(x), r1=165(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=469(x), r6=159(y), r7=27(width), r8=29(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 165
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 469
LDI r6, 159
LDI r7, 27
LDI r8, 29
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
