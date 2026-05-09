; DESCRIPTION: Composite: . Then Places a green circle of radius 17 at center (219, 45). Then Places a white line segment connecting (115, 255) to (78, 27).
; PLAN: r0=219(x), r1=45(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=115(x1), r1=255(y1), r2=78(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 17 at center (219, 45).
; PLAN: r0=219(x), r1=45(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 45
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white line segment connecting (115, 255) to (78, 27).
; PLAN: r0=115(x1), r1=255(y1), r2=78(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 255
LDI r2, 78
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
