; DESCRIPTION: Composite: . Then Places a purple line segment connecting (100, 191) to (4, 153). Then Places a orange 90x67 rectangle at position (67, 8).
; PLAN: r0=100(x1), r1=191(y1), r2=4(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=67(x), r1=8(y), r2=90(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (100, 191) to (4, 153).
; PLAN: r0=100(x1), r1=191(y1), r2=4(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 191
LDI r2, 4
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 90x67 rectangle at position (67, 8).
; PLAN: r0=67(x), r1=8(y), r2=90(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 8
LDI r2, 90
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
