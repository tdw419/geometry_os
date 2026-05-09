; DESCRIPTION: Composite: . Then Places a blue line segment connecting (63, 174) to (190, 10). Then Creates a green circular shape at (67, 236) with radius 10.
; PLAN: r0=63(x1), r1=174(y1), r2=190(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=67(x), r1=236(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (63, 174) to (190, 10).
; PLAN: r0=63(x1), r1=174(y1), r2=190(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 174
LDI r2, 190
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (67, 236) with radius 10.
; PLAN: r0=67(x), r1=236(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 236
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
