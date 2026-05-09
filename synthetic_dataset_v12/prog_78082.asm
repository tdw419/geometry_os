; DESCRIPTION: Renders a yellow box of size 67x110 starting at (78, 40).
; PLAN: r0=78(x), r1=40(y), r2=67(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 40
LDI r2, 67
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
