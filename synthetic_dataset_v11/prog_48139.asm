; DESCRIPTION: Composite: . Then Places a orange 60x30 rectangle at position (81, 109). Then Places a black line segment connecting (148, 181) to (216, 53).
; PLAN: r0=81(x), r1=109(y), r2=60(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=148(x1), r1=181(y1), r2=216(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange 60x30 rectangle at position (81, 109).
; PLAN: r0=81(x), r1=109(y), r2=60(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 109
LDI r2, 60
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (148, 181) to (216, 53).
; PLAN: r0=148(x1), r1=181(y1), r2=216(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 181
LDI r2, 216
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
