; DESCRIPTION: Renders a purple box of size 102x35 starting at (397, 62).
; PLAN: r0=397(x), r1=62(y), r2=102(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 62
LDI r2, 102
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
