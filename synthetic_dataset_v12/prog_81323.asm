; DESCRIPTION: Renders a yellow box of size 49x59 starting at (2, 75).
; PLAN: r0=2(x), r1=75(y), r2=49(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 75
LDI r2, 49
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
