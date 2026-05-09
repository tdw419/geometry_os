; DESCRIPTION: Composite: . Then Renders a green disk with center (107, 219) and radius 22. Then Places a yellow line segment connecting (48, 45) to (64, 167).
; PLAN: r0=107(x), r1=219(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=48(x1), r1=45(y1), r2=64(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (107, 219) and radius 22.
; PLAN: r0=107(x), r1=219(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 219
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (48, 45) to (64, 167).
; PLAN: r0=48(x1), r1=45(y1), r2=64(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 45
LDI r2, 64
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
