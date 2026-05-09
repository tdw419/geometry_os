; DESCRIPTION: Composite: Draws a orange rectangle at (381, 196) with width 97 and height 55 then Places a magenta line segment connecting (167, 108) to (187, 11).
; PLAN: r0=381(x), r1=196(y), r2=97(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x1), r6=108(y1), r7=187(x2), r8=11(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 196
LDI r2, 97
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 108
LDI r7, 187
LDI r8, 11
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
