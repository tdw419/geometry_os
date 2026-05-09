; DESCRIPTION: Composite: . Then Places a green line segment connecting (169, 213) to (232, 56). Then Creates a yellow circular shape at (144, 137) with radius 46.
; PLAN: r0=169(x1), r1=213(y1), r2=232(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=144(x), r1=137(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (169, 213) to (232, 56).
; PLAN: r0=169(x1), r1=213(y1), r2=232(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 213
LDI r2, 232
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (144, 137) with radius 46.
; PLAN: r0=144(x), r1=137(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 137
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
