; DESCRIPTION: Composite: Draws a magenta rectangle at (297, 95) with width 97 and height 101 then Places a red dot at position (470, 124).
; PLAN: r0=297(x), r1=95(y), r2=97(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=124(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 297
LDI r1, 95
LDI r2, 97
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 124
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
