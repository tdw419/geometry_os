; DESCRIPTION: Composite: . Then Places a green line segment connecting (79, 10) to (58, 33). Then Renders a blue box of size 53x43 starting at (97, 145).
; PLAN: r0=79(x1), r1=10(y1), r2=58(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=97(x), r1=145(y), r2=53(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green line segment connecting (79, 10) to (58, 33).
; PLAN: r0=79(x1), r1=10(y1), r2=58(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 10
LDI r2, 58
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 53x43 starting at (97, 145).
; PLAN: r0=97(x), r1=145(y), r2=53(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 145
LDI r2, 53
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
