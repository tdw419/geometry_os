; DESCRIPTION: Renders a black box of size 35x15 starting at (397, 90).
; PLAN: r0=397(x), r1=90(y), r2=35(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 90
LDI r2, 35
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
