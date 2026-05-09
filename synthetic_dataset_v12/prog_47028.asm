; DESCRIPTION: Renders a yellow box of size 43x33 starting at (134, 11).
; PLAN: r0=134(x), r1=11(y), r2=43(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 11
LDI r2, 43
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
