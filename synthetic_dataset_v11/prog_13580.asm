; DESCRIPTION: Composite: . Then Places a orange line segment connecting (209, 0) to (142, 121). Then Draws a black rectangle at (154, 105) with width 72 and height 118.
; PLAN: r0=209(x1), r1=0(y1), r2=142(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=154(x), r1=105(y), r2=72(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (209, 0) to (142, 121).
; PLAN: r0=209(x1), r1=0(y1), r2=142(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 0
LDI r2, 142
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black rectangle at (154, 105) with width 72 and height 118.
; PLAN: r0=154(x), r1=105(y), r2=72(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 105
LDI r2, 72
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
