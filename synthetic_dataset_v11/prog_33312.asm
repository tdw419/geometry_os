; DESCRIPTION: Composite: . Then Renders a yellow box of size 72x70 starting at (172, 89). Then Places a orange line segment connecting (206, 87) to (45, 8).
; PLAN: r0=172(x), r1=89(y), r2=72(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=206(x1), r1=87(y1), r2=45(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 72x70 starting at (172, 89).
; PLAN: r0=172(x), r1=89(y), r2=72(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 89
LDI r2, 72
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange line segment connecting (206, 87) to (45, 8).
; PLAN: r0=206(x1), r1=87(y1), r2=45(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 87
LDI r2, 45
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
