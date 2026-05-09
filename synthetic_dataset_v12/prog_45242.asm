; DESCRIPTION: Renders a green box of size 119x51 starting at (376, 100).
; PLAN: r0=376(x), r1=100(y), r2=119(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 100
LDI r2, 119
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
