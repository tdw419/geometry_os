; DESCRIPTION: Renders a yellow box of size 53x49 starting at (56, 33).
; PLAN: r0=56(x), r1=33(y), r2=53(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 33
LDI r2, 53
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
