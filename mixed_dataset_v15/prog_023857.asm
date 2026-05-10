; DESCRIPTION: Renders a black box of size 78x79 starting at (397, 78).
; PLAN: r0=397(x), r1=78(y), r2=78(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 78
LDI r2, 78
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
