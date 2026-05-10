; DESCRIPTION: Composite: Places a green dot at position (463, 130) then Draws a black rectangle at (58, 147) with width 95 and height 50.
; PLAN: r0=463(x), r1=130(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=58(x), r6=147(y), r7=95(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 130
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 58
LDI r6, 147
LDI r7, 95
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
