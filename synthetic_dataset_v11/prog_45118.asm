; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (144, 34) to (181, 137). Then Creates a blue circular shape at (202, 66) with radius 24.
; PLAN: r0=144(x1), r1=34(y1), r2=181(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=202(x), r1=66(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan line segment connecting (144, 34) to (181, 137).
; PLAN: r0=144(x1), r1=34(y1), r2=181(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 34
LDI r2, 181
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (202, 66) with radius 24.
; PLAN: r0=202(x), r1=66(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 66
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
