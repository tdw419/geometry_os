; DESCRIPTION: Composite: . Then Renders a white line between points (69, 48) and (17, 76). Then Draws a blue circle centered at (67, 148) with radius 45.
; PLAN: r0=69(x1), r1=48(y1), r2=17(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=67(x), r1=148(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (69, 48) and (17, 76).
; PLAN: r0=69(x1), r1=48(y1), r2=17(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 48
LDI r2, 17
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (67, 148) with radius 45.
; PLAN: r0=67(x), r1=148(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 148
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
