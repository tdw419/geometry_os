; DESCRIPTION: Composite: . Then Places a black circle of radius 68 at center (108, 98). Then Places a green line segment connecting (230, 76) to (89, 209).
; PLAN: r0=108(x), r1=98(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=230(x1), r1=76(y1), r2=89(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 68 at center (108, 98).
; PLAN: r0=108(x), r1=98(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 98
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green line segment connecting (230, 76) to (89, 209).
; PLAN: r0=230(x1), r1=76(y1), r2=89(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 76
LDI r2, 89
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
