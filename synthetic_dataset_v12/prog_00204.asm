; DESCRIPTION: Renders a yellow box of size 10x62 starting at (338, 18).
; PLAN: r0=338(x), r1=18(y), r2=10(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 18
LDI r2, 10
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
