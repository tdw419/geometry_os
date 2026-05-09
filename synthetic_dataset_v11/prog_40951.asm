; DESCRIPTION: Composite: . Then Places a red line segment connecting (190, 233) to (8, 232). Then Creates a green circular shape at (126, 147) with radius 75.
; PLAN: r0=190(x1), r1=233(y1), r2=8(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=126(x), r1=147(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (190, 233) to (8, 232).
; PLAN: r0=190(x1), r1=233(y1), r2=8(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 233
LDI r2, 8
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (126, 147) with radius 75.
; PLAN: r0=126(x), r1=147(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 147
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
