; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (141, 88) to (99, 205). Then Places a yellow 15x103 rectangle at position (144, 88).
; PLAN: r0=141(x1), r1=88(y1), r2=99(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=144(x), r1=88(y), r2=15(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow line segment connecting (141, 88) to (99, 205).
; PLAN: r0=141(x1), r1=88(y1), r2=99(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 88
LDI r2, 99
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 15x103 rectangle at position (144, 88).
; PLAN: r0=144(x), r1=88(y), r2=15(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 88
LDI r2, 15
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
