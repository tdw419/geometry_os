; DESCRIPTION: Composite: . Then Places a purple circle of radius 13 at center (231, 198). Then Draws a purple line from (174, 84) to (64, 67).
; PLAN: r0=231(x), r1=198(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=174(x1), r1=84(y1), r2=64(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 13 at center (231, 198).
; PLAN: r0=231(x), r1=198(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 198
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (174, 84) to (64, 67).
; PLAN: r0=174(x1), r1=84(y1), r2=64(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 84
LDI r2, 64
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
