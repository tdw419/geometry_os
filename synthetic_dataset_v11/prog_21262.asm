; DESCRIPTION: Composite: . Then Places a red 74x13 rectangle at position (119, 220). Then Places a orange line segment connecting (115, 232) to (134, 140).
; PLAN: r0=119(x), r1=220(y), r2=74(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=115(x1), r1=232(y1), r2=134(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 74x13 rectangle at position (119, 220).
; PLAN: r0=119(x), r1=220(y), r2=74(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 220
LDI r2, 74
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange line segment connecting (115, 232) to (134, 140).
; PLAN: r0=115(x1), r1=232(y1), r2=134(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 232
LDI r2, 134
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
