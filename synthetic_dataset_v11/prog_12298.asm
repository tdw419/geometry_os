; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (63, 13) to (48, 62). Then Places a blue circle of radius 47 at center (178, 157).
; PLAN: r0=63(x1), r1=13(y1), r2=48(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=178(x), r1=157(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (63, 13) to (48, 62).
; PLAN: r0=63(x1), r1=13(y1), r2=48(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 13
LDI r2, 48
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 47 at center (178, 157).
; PLAN: r0=178(x), r1=157(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 157
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
