; DESCRIPTION: Composite: . Then Draws a green line from (225, 181) to (53, 73). Then Draws a black rectangle at (25, 163) with width 67 and height 67.
; PLAN: r0=225(x1), r1=181(y1), r2=53(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=25(x), r1=163(y), r2=67(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green line from (225, 181) to (53, 73).
; PLAN: r0=225(x1), r1=181(y1), r2=53(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 181
LDI r2, 53
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black rectangle at (25, 163) with width 67 and height 67.
; PLAN: r0=25(x), r1=163(y), r2=67(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 163
LDI r2, 67
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
