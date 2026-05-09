; DESCRIPTION: Places a red 101x68 rectangle at position (257, 116).
; PLAN: r0=257(x), r1=116(y), r2=101(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 116
LDI r2, 101
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
