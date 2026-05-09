; DESCRIPTION: Composite: . Then Creates a green circular shape at (170, 113) with radius 48. Then Places a yellow line segment connecting (49, 212) to (236, 59).
; PLAN: r0=170(x), r1=113(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=49(x1), r1=212(y1), r2=236(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green circular shape at (170, 113) with radius 48.
; PLAN: r0=170(x), r1=113(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 113
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (49, 212) to (236, 59).
; PLAN: r0=49(x1), r1=212(y1), r2=236(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 212
LDI r2, 236
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
