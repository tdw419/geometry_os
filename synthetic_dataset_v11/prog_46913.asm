; DESCRIPTION: Composite: . Then Places a green circle of radius 78 at center (135, 160). Then Places a orange line segment connecting (253, 187) to (197, 49).
; PLAN: r0=135(x), r1=160(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=253(x1), r1=187(y1), r2=197(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 78 at center (135, 160).
; PLAN: r0=135(x), r1=160(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 160
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (253, 187) to (197, 49).
; PLAN: r0=253(x1), r1=187(y1), r2=197(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 187
LDI r2, 197
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
