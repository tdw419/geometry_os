; DESCRIPTION: Composite: . Then Renders a blue box of size 88x101 starting at (162, 24). Then Draws a black line from (187, 78) to (239, 156).
; PLAN: r0=162(x), r1=24(y), r2=88(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=187(x1), r1=78(y1), r2=239(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue box of size 88x101 starting at (162, 24).
; PLAN: r0=162(x), r1=24(y), r2=88(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 24
LDI r2, 88
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black line from (187, 78) to (239, 156).
; PLAN: r0=187(x1), r1=78(y1), r2=239(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 78
LDI r2, 239
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
