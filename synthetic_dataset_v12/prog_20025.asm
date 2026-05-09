; DESCRIPTION: Renders a blue box of size 92x13 starting at (56, 32).
; PLAN: r0=56(x), r1=32(y), r2=92(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 32
LDI r2, 92
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
