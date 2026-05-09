; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (123, 17) to (123, 90). Then Draws a green rectangle at (25, 20) with width 106 and height 64.
; PLAN: r0=123(x1), r1=17(y1), r2=123(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=25(x), r1=20(y), r2=106(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow line segment connecting (123, 17) to (123, 90).
; PLAN: r0=123(x1), r1=17(y1), r2=123(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 17
LDI r2, 123
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green rectangle at (25, 20) with width 106 and height 64.
; PLAN: r0=25(x), r1=20(y), r2=106(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 20
LDI r2, 106
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
