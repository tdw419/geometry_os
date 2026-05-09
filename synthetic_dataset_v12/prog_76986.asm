; DESCRIPTION: Places a black 32x89 rectangle at position (397, 165).
; PLAN: r0=397(x), r1=165(y), r2=32(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 165
LDI r2, 32
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
