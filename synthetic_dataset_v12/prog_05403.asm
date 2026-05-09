; DESCRIPTION: Renders a black box of size 119x59 starting at (0, 9).
; PLAN: r0=0(x), r1=9(y), r2=119(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 9
LDI r2, 119
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
