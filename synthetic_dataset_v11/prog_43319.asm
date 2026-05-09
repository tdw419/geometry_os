; DESCRIPTION: Composite: . Then Renders a purple line between points (14, 237) and (84, 63). Then Places a purple 67x98 rectangle at position (11, 8).
; PLAN: r0=14(x1), r1=237(y1), r2=84(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=11(x), r1=8(y), r2=67(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (14, 237) and (84, 63).
; PLAN: r0=14(x1), r1=237(y1), r2=84(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 237
LDI r2, 84
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 67x98 rectangle at position (11, 8).
; PLAN: r0=11(x), r1=8(y), r2=67(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 8
LDI r2, 67
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
