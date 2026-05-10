; DESCRIPTION: Composite: Draws a magenta rectangle at (297, 131) with width 88 and height 11 then Places a white line segment connecting (407, 45) to (511, 63).
; PLAN: r0=297(x), r1=131(y), r2=88(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x1), r6=45(y1), r7=511(x2), r8=63(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 131
LDI r2, 88
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 45
LDI r7, 511
LDI r8, 63
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
