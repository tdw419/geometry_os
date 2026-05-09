; DESCRIPTION: Composite: . Then Renders a cyan line between points (124, 224) and (254, 45). Then Draws a blue circle centered at (159, 108) with radius 57.
; PLAN: r0=124(x1), r1=224(y1), r2=254(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=159(x), r1=108(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (124, 224) and (254, 45).
; PLAN: r0=124(x1), r1=224(y1), r2=254(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 224
LDI r2, 254
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (159, 108) with radius 57.
; PLAN: r0=159(x), r1=108(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 108
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
