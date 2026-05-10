; DESCRIPTION: Composite: Draws a magenta rectangle at (261, 6) with width 50 and height 59 then Places a white line segment connecting (112, 9) to (280, 129).
; PLAN: r0=261(x), r1=6(y), r2=50(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x1), r6=9(y1), r7=280(x2), r8=129(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 6
LDI r2, 50
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 9
LDI r7, 280
LDI r8, 129
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
