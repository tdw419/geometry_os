; DESCRIPTION: Composite: Renders a magenta line between points (381, 101) and (167, 210) then Renders a green box of size 100x62 starting at (343, 127).
; PLAN: r0=381(x1), r1=101(y1), r2=167(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=127(y), r7=100(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 101
LDI r2, 167
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 127
LDI r7, 100
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
