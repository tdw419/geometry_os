; DESCRIPTION: Composite: . Then Places a blue 85x45 rectangle at position (144, 181). Then Places a cyan line segment connecting (58, 21) to (109, 162).
; PLAN: r0=144(x), r1=181(y), r2=85(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=58(x1), r1=21(y1), r2=109(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue 85x45 rectangle at position (144, 181).
; PLAN: r0=144(x), r1=181(y), r2=85(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 181
LDI r2, 85
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (58, 21) to (109, 162).
; PLAN: r0=58(x1), r1=21(y1), r2=109(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 21
LDI r2, 109
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
