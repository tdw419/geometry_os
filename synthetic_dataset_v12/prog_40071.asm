; DESCRIPTION: Composite: Places a magenta dot at position (433, 30) then Draws a green rectangle at (126, 191) with width 25 and height 43.
; PLAN: r0=433(x), r1=30(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=191(y), r7=25(width), r8=43(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 30
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 126
LDI r6, 191
LDI r7, 25
LDI r8, 43
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
