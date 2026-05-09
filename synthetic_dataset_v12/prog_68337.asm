; DESCRIPTION: Places a purple 72x96 rectangle at position (257, 41).
; PLAN: r0=257(x), r1=41(y), r2=72(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 41
LDI r2, 72
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
