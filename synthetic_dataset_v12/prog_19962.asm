; DESCRIPTION: Composite: Places a black dot at position (321, 178) then Draws a cyan rectangle at (324, 64) with width 53 and height 62.
; PLAN: r0=321(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=64(y), r7=53(width), r8=62(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 178
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 324
LDI r6, 64
LDI r7, 53
LDI r8, 62
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
