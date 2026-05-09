; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (89, 75) with radius 56. Then Places a green line segment connecting (249, 10) to (203, 182).
; PLAN: r0=89(x), r1=75(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=249(x1), r1=10(y1), r2=203(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (89, 75) with radius 56.
; PLAN: r0=89(x), r1=75(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 75
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green line segment connecting (249, 10) to (203, 182).
; PLAN: r0=249(x1), r1=10(y1), r2=203(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 10
LDI r2, 203
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
