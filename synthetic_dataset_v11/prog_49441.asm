; DESCRIPTION: Composite: . Then Renders a green box of size 110x57 starting at (8, 62). Then Places a orange line segment connecting (125, 4) to (56, 82).
; PLAN: r0=8(x), r1=62(y), r2=110(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=125(x1), r1=4(y1), r2=56(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green box of size 110x57 starting at (8, 62).
; PLAN: r0=8(x), r1=62(y), r2=110(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 62
LDI r2, 110
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange line segment connecting (125, 4) to (56, 82).
; PLAN: r0=125(x1), r1=4(y1), r2=56(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 4
LDI r2, 56
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
