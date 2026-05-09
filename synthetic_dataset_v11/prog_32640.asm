; DESCRIPTION: Composite: . Then Places a orange line segment connecting (184, 210) to (136, 86). Then Renders a purple box of size 102x23 starting at (45, 72).
; PLAN: r0=184(x1), r1=210(y1), r2=136(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=45(x), r1=72(y), r2=102(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (184, 210) to (136, 86).
; PLAN: r0=184(x1), r1=210(y1), r2=136(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 210
LDI r2, 136
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 102x23 starting at (45, 72).
; PLAN: r0=45(x), r1=72(y), r2=102(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 72
LDI r2, 102
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
