; DESCRIPTION: Composite: . Then Draws a blue circle centered at (82, 174) with radius 45. Then Renders a black line between points (224, 38) and (93, 245).
; PLAN: r0=82(x), r1=174(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=224(x1), r1=38(y1), r2=93(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (82, 174) with radius 45.
; PLAN: r0=82(x), r1=174(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 174
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (224, 38) and (93, 245).
; PLAN: r0=224(x1), r1=38(y1), r2=93(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 38
LDI r2, 93
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
