; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (179, 115) with width 20 and height 69. Then Draws a yellow line from (22, 103) to (85, 184).
; PLAN: r0=179(x), r1=115(y), r2=20(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=22(x1), r1=103(y1), r2=85(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow rectangle at (179, 115) with width 20 and height 69.
; PLAN: r0=179(x), r1=115(y), r2=20(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 115
LDI r2, 20
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (22, 103) to (85, 184).
; PLAN: r0=22(x1), r1=103(y1), r2=85(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 103
LDI r2, 85
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
