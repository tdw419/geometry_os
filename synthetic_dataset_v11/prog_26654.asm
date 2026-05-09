; DESCRIPTION: Composite: . Then Renders a green line between points (82, 233) and (74, 30). Then Creates a purple circular shape at (203, 88) with radius 17.
; PLAN: r0=82(x1), r1=233(y1), r2=74(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=203(x), r1=88(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green line between points (82, 233) and (74, 30).
; PLAN: r0=82(x1), r1=233(y1), r2=74(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 233
LDI r2, 74
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (203, 88) with radius 17.
; PLAN: r0=203(x), r1=88(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 88
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
