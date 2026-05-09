; DESCRIPTION: Composite: . Then Places a black line segment connecting (18, 21) to (69, 46). Then Renders a white disk with center (67, 204) and radius 29.
; PLAN: r0=18(x1), r1=21(y1), r2=69(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=67(x), r1=204(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (18, 21) to (69, 46).
; PLAN: r0=18(x1), r1=21(y1), r2=69(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 21
LDI r2, 69
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (67, 204) and radius 29.
; PLAN: r0=67(x), r1=204(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 204
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
