; DESCRIPTION: Composite: Places a yellow dot at position (158, 185) then Draws a yellow rectangle at (337, 48) with width 16 and height 107.
; PLAN: r0=158(x), r1=185(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=337(x), r6=48(y), r7=16(width), r8=107(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 185
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 337
LDI r6, 48
LDI r7, 16
LDI r8, 107
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
