; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (25, 178) to (156, 125). Then Creates a black circular shape at (135, 88) with radius 20.
; PLAN: r0=25(x1), r1=178(y1), r2=156(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=135(x), r1=88(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (25, 178) to (156, 125).
; PLAN: r0=25(x1), r1=178(y1), r2=156(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 178
LDI r2, 156
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (135, 88) with radius 20.
; PLAN: r0=135(x), r1=88(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 88
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
