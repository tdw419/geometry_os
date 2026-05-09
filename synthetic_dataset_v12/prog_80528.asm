; DESCRIPTION: Renders a yellow box of size 105x21 starting at (303, 129).
; PLAN: r0=303(x), r1=129(y), r2=105(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 129
LDI r2, 105
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
