; DESCRIPTION: Composite: . Then Renders a black box of size 36x62 starting at (131, 59). Then Renders a yellow disk with center (133, 38) and radius 13.
; PLAN: r0=131(x), r1=59(y), r2=36(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=133(x), r1=38(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 36x62 starting at (131, 59).
; PLAN: r0=131(x), r1=59(y), r2=36(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 59
LDI r2, 36
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (133, 38) and radius 13.
; PLAN: r0=133(x), r1=38(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 38
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
