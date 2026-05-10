; DESCRIPTION: Places a black 28x108 rectangle at position (397, 114).
; PLAN: r0=397(x), r1=114(y), r2=28(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 114
LDI r2, 28
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
