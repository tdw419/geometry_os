; DESCRIPTION: Composite: Draws a orange rectangle at (410, 114) with width 66 and height 63 then Places a blue line segment connecting (161, 148) to (312, 133).
; PLAN: r0=410(x), r1=114(y), r2=66(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x1), r6=148(y1), r7=312(x2), r8=133(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 114
LDI r2, 66
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 148
LDI r7, 312
LDI r8, 133
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
