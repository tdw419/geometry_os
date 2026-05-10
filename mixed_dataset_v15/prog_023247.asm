; DESCRIPTION: Composite: Places a magenta line segment connecting (101, 217) to (51, 73) then Draws a blue rectangle at (459, 103) with width 29 and height 11.
; PLAN: r0=101(x1), r1=217(y1), r2=51(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=103(y), r7=29(width), r8=11(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 217
LDI r2, 51
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 103
LDI r7, 29
LDI r8, 11
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
