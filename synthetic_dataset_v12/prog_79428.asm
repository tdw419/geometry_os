; DESCRIPTION: Renders a blue box of size 64x21 starting at (397, 181).
; PLAN: r0=397(x), r1=181(y), r2=64(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 181
LDI r2, 64
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
