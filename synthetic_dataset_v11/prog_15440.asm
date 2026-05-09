; DESCRIPTION: Composite: . Then Places a orange circle of radius 29 at center (109, 59). Then Renders a yellow box of size 105x97 starting at (20, 69).
; PLAN: r0=109(x), r1=59(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=20(x), r1=69(y), r2=105(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 29 at center (109, 59).
; PLAN: r0=109(x), r1=59(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 59
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow box of size 105x97 starting at (20, 69).
; PLAN: r0=20(x), r1=69(y), r2=105(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 69
LDI r2, 105
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
