; DESCRIPTION: Composite: . Then Places a blue line segment connecting (139, 124) to (99, 68). Then Places a red 85x49 rectangle at position (21, 78).
; PLAN: r0=139(x1), r1=124(y1), r2=99(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=21(x), r1=78(y), r2=85(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (139, 124) to (99, 68).
; PLAN: r0=139(x1), r1=124(y1), r2=99(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 124
LDI r2, 99
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red 85x49 rectangle at position (21, 78).
; PLAN: r0=21(x), r1=78(y), r2=85(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 78
LDI r2, 85
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
