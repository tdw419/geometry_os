; DESCRIPTION: Composite: . Then Places a magenta circle of radius 32 at center (207, 110). Then Places a red line segment connecting (31, 128) to (125, 26).
; PLAN: r0=207(x), r1=110(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=31(x1), r1=128(y1), r2=125(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 32 at center (207, 110).
; PLAN: r0=207(x), r1=110(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 110
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red line segment connecting (31, 128) to (125, 26).
; PLAN: r0=31(x1), r1=128(y1), r2=125(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 128
LDI r2, 125
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
