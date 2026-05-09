; DESCRIPTION: Composite: . Then Places a green line segment connecting (198, 184) to (171, 85). Then Creates a black circular shape at (149, 33) with radius 33.
; PLAN: r0=198(x1), r1=184(y1), r2=171(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=149(x), r1=33(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (198, 184) to (171, 85).
; PLAN: r0=198(x1), r1=184(y1), r2=171(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 184
LDI r2, 171
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (149, 33) with radius 33.
; PLAN: r0=149(x), r1=33(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 33
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
