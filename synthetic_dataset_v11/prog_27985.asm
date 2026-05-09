; DESCRIPTION: Composite: . Then Creates a red circular shape at (117, 219) with radius 36. Then Places a green line segment connecting (89, 183) to (50, 131).
; PLAN: r0=117(x), r1=219(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=89(x1), r1=183(y1), r2=50(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (117, 219) with radius 36.
; PLAN: r0=117(x), r1=219(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 219
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green line segment connecting (89, 183) to (50, 131).
; PLAN: r0=89(x1), r1=183(y1), r2=50(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 183
LDI r2, 50
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
