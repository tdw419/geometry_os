; DESCRIPTION: Composite: . Then Places a white circle of radius 65 at center (140, 128). Then Places a blue line segment connecting (70, 8) to (181, 145).
; PLAN: r0=140(x), r1=128(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=70(x1), r1=8(y1), r2=181(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 65 at center (140, 128).
; PLAN: r0=140(x), r1=128(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 128
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue line segment connecting (70, 8) to (181, 145).
; PLAN: r0=70(x1), r1=8(y1), r2=181(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 8
LDI r2, 181
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
