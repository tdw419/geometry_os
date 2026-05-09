; DESCRIPTION: Renders a yellow box of size 56x49 starting at (421, 133).
; PLAN: r0=421(x), r1=133(y), r2=56(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 133
LDI r2, 56
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
