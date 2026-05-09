; DESCRIPTION: Composite: . Then Draws a purple rectangle at (99, 129) with width 97 and height 73. Then Places a yellow line segment connecting (137, 116) to (215, 72).
; PLAN: r0=99(x), r1=129(y), r2=97(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=137(x1), r1=116(y1), r2=215(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple rectangle at (99, 129) with width 97 and height 73.
; PLAN: r0=99(x), r1=129(y), r2=97(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 129
LDI r2, 97
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (137, 116) to (215, 72).
; PLAN: r0=137(x1), r1=116(y1), r2=215(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 116
LDI r2, 215
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
