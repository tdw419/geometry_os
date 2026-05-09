; DESCRIPTION: Composite: . Then Draws a purple line from (133, 198) to (45, 67). Then Places a green circle of radius 68 at center (104, 167).
; PLAN: r0=133(x1), r1=198(y1), r2=45(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=104(x), r1=167(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (133, 198) to (45, 67).
; PLAN: r0=133(x1), r1=198(y1), r2=45(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 198
LDI r2, 45
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 68 at center (104, 167).
; PLAN: r0=104(x), r1=167(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 167
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
