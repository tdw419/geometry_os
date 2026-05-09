; DESCRIPTION: Composite: . Then Places a magenta circle of radius 36 at center (60, 142). Then Places a cyan line segment connecting (245, 249) to (99, 200).
; PLAN: r0=60(x), r1=142(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=245(x1), r1=249(y1), r2=99(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 36 at center (60, 142).
; PLAN: r0=60(x), r1=142(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 142
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (245, 249) to (99, 200).
; PLAN: r0=245(x1), r1=249(y1), r2=99(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 249
LDI r2, 99
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
