; DESCRIPTION: Composite: . Then Renders a blue box of size 112x85 starting at (69, 11). Then Places a orange line segment connecting (4, 236) to (234, 62).
; PLAN: r0=69(x), r1=11(y), r2=112(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=4(x1), r1=236(y1), r2=234(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue box of size 112x85 starting at (69, 11).
; PLAN: r0=69(x), r1=11(y), r2=112(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 11
LDI r2, 112
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange line segment connecting (4, 236) to (234, 62).
; PLAN: r0=4(x1), r1=236(y1), r2=234(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 236
LDI r2, 234
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
