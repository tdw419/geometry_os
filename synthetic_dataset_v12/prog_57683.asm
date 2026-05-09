; DESCRIPTION: Renders a green box of size 88x45 starting at (0, 101).
; PLAN: r0=0(x), r1=101(y), r2=88(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 101
LDI r2, 88
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
