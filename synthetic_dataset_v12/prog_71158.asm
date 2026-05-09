; DESCRIPTION: Composite: Places a black dot at position (510, 95) then Draws a yellow rectangle at (216, 147) with width 25 and height 85.
; PLAN: r0=510(x), r1=95(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=147(y), r7=25(width), r8=85(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 510
LDI r1, 95
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 216
LDI r6, 147
LDI r7, 25
LDI r8, 85
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
