; DESCRIPTION: Composite: Draws a magenta rectangle at (304, 84) with width 36 and height 96 then Places a blue line segment connecting (302, 56) to (345, 163).
; PLAN: r0=304(x), r1=84(y), r2=36(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x1), r6=56(y1), r7=345(x2), r8=163(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 84
LDI r2, 36
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 56
LDI r7, 345
LDI r8, 163
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
