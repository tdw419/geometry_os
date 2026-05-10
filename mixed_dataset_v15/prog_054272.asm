; DESCRIPTION: Composite: Places a red 26x53 rectangle at position (451, 104) then Places a green line segment connecting (291, 132) to (476, 67).
; PLAN: r0=451(x), r1=104(y), r2=26(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x1), r6=132(y1), r7=476(x2), r8=67(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 104
LDI r2, 26
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 132
LDI r7, 476
LDI r8, 67
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
