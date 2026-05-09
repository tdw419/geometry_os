; DESCRIPTION: Composite: . Then Places a red 43x101 rectangle at position (149, 110). Then Places a orange line segment connecting (44, 193) to (245, 70).
; PLAN: r0=149(x), r1=110(y), r2=43(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=44(x1), r1=193(y1), r2=245(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 43x101 rectangle at position (149, 110).
; PLAN: r0=149(x), r1=110(y), r2=43(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 110
LDI r2, 43
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange line segment connecting (44, 193) to (245, 70).
; PLAN: r0=44(x1), r1=193(y1), r2=245(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 193
LDI r2, 245
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
