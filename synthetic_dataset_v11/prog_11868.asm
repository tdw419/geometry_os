; DESCRIPTION: Composite: . Then Places a green circle of radius 21 at center (137, 212). Then Places a white line segment connecting (233, 178) to (244, 215).
; PLAN: r0=137(x), r1=212(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=233(x1), r1=178(y1), r2=244(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 21 at center (137, 212).
; PLAN: r0=137(x), r1=212(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 212
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white line segment connecting (233, 178) to (244, 215).
; PLAN: r0=233(x1), r1=178(y1), r2=244(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 178
LDI r2, 244
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
