; DESCRIPTION: Composite: . Then Places a red 88x33 rectangle at position (133, 85). Then Draws a yellow line from (165, 139) to (34, 67).
; PLAN: r0=133(x), r1=85(y), r2=88(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=165(x1), r1=139(y1), r2=34(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 88x33 rectangle at position (133, 85).
; PLAN: r0=133(x), r1=85(y), r2=88(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 85
LDI r2, 88
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (165, 139) to (34, 67).
; PLAN: r0=165(x1), r1=139(y1), r2=34(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 139
LDI r2, 34
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
