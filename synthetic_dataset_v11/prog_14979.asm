; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (146, 64) to (37, 9). Then Places a yellow circle of radius 62 at center (174, 175).
; PLAN: r0=146(x1), r1=64(y1), r2=37(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=174(x), r1=175(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (146, 64) to (37, 9).
; PLAN: r0=146(x1), r1=64(y1), r2=37(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 64
LDI r2, 37
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 62 at center (174, 175).
; PLAN: r0=174(x), r1=175(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 175
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
