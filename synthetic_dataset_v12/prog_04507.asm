; DESCRIPTION: Renders a blue box of size 119x92 starting at (209, 11).
; PLAN: r0=209(x), r1=11(y), r2=119(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 11
LDI r2, 119
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
