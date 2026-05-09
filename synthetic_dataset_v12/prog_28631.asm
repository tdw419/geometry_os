; DESCRIPTION: Places a black 81x14 rectangle at position (421, 100).
; PLAN: r0=421(x), r1=100(y), r2=81(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 100
LDI r2, 81
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
