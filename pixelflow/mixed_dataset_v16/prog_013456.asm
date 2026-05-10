; DESCRIPTION: Composite: Places a cyan dot at position (5, 73) then Draws a cyan rectangle at (8, 99) with width 72 and height 69.
; PLAN: r0=5(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=8(x), r6=99(y), r7=72(width), r8=69(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 73
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 8
LDI r6, 99
LDI r7, 72
LDI r8, 69
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
