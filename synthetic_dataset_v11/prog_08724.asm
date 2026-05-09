; DESCRIPTION: Composite: . Then Places a orange line segment connecting (255, 22) to (62, 30). Then Renders a green disk with center (171, 184) and radius 37.
; PLAN: r0=255(x1), r1=22(y1), r2=62(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=171(x), r1=184(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (255, 22) to (62, 30).
; PLAN: r0=255(x1), r1=22(y1), r2=62(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 22
LDI r2, 62
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (171, 184) and radius 37.
; PLAN: r0=171(x), r1=184(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 184
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
