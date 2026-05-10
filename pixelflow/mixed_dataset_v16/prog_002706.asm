; DESCRIPTION: Renders a yellow box of size 119x56 starting at (100, 119).
; PLAN: r0=100(x), r1=119(y), r2=119(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 119
LDI r2, 119
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
