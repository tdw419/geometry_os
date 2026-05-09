; DESCRIPTION: Composite: . Then Places a black 72x53 rectangle at position (174, 73). Then Places a purple line segment connecting (240, 104) to (187, 15).
; PLAN: r0=174(x), r1=73(y), r2=72(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=240(x1), r1=104(y1), r2=187(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 72x53 rectangle at position (174, 73).
; PLAN: r0=174(x), r1=73(y), r2=72(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 73
LDI r2, 72
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (240, 104) to (187, 15).
; PLAN: r0=240(x1), r1=104(y1), r2=187(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 104
LDI r2, 187
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
