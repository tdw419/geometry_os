; DESCRIPTION: Renders a blue box of size 76x100 starting at (253, 32).
; PLAN: r0=253(x), r1=32(y), r2=76(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 32
LDI r2, 76
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
