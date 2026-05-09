; DESCRIPTION: Composite: Places a green dot at position (42, 97) then Draws a yellow rectangle at (413, 132) with width 88 and height 58.
; PLAN: r0=42(x), r1=97(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=132(y), r7=88(width), r8=58(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 97
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 413
LDI r6, 132
LDI r7, 88
LDI r8, 58
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
