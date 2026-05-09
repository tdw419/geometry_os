; DESCRIPTION: Composite: . Then Places a orange line segment connecting (134, 22) to (120, 228). Then Draws a black circle centered at (58, 176) with radius 12.
; PLAN: r0=134(x1), r1=22(y1), r2=120(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=58(x), r1=176(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (134, 22) to (120, 228).
; PLAN: r0=134(x1), r1=22(y1), r2=120(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 22
LDI r2, 120
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (58, 176) with radius 12.
; PLAN: r0=58(x), r1=176(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 176
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
