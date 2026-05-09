; DESCRIPTION: Renders a yellow box of size 22x59 starting at (227, 94).
; PLAN: r0=227(x), r1=94(y), r2=22(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 94
LDI r2, 22
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
