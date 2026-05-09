; DESCRIPTION: Renders a blue box of size 45x109 starting at (291, 81).
; PLAN: r0=291(x), r1=81(y), r2=45(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 81
LDI r2, 45
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
