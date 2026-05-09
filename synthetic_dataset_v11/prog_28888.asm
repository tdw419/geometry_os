; DESCRIPTION: Composite: . Then Creates a blue circular shape at (71, 87) with radius 41. Then Renders a green line between points (204, 6) and (93, 50).
; PLAN: r0=71(x), r1=87(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=204(x1), r1=6(y1), r2=93(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (71, 87) with radius 41.
; PLAN: r0=71(x), r1=87(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 87
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green line between points (204, 6) and (93, 50).
; PLAN: r0=204(x1), r1=6(y1), r2=93(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 6
LDI r2, 93
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
