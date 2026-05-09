; DESCRIPTION: Renders a yellow box of size 58x12 starting at (105, 11).
; PLAN: r0=105(x), r1=11(y), r2=58(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 11
LDI r2, 58
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
