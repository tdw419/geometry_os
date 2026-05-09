; DESCRIPTION: Renders a yellow box of size 91x78 starting at (40, 12).
; PLAN: r0=40(x), r1=12(y), r2=91(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 12
LDI r2, 91
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
