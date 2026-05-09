; DESCRIPTION: Composite: Renders a magenta line between points (59, 30) and (88, 76) then Draws a magenta rectangle at (111, 107) with width 22 and height 89.
; PLAN: r0=59(x1), r1=30(y1), r2=88(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=107(y), r7=22(width), r8=89(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 30
LDI r2, 88
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 107
LDI r7, 22
LDI r8, 89
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
