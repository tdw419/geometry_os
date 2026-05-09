; DESCRIPTION: Composite: . Then Places a orange circle of radius 20 at center (78, 56). Then Renders a blue line between points (122, 129) and (67, 234).
; PLAN: r0=78(x), r1=56(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=122(x1), r1=129(y1), r2=67(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 20 at center (78, 56).
; PLAN: r0=78(x), r1=56(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 56
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue line between points (122, 129) and (67, 234).
; PLAN: r0=122(x1), r1=129(y1), r2=67(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 129
LDI r2, 67
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
