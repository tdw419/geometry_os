; DESCRIPTION: Renders a white box of size 49x35 starting at (10, 58).
; PLAN: r0=10(x), r1=58(y), r2=49(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 58
LDI r2, 49
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
