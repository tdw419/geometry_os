; DESCRIPTION: Places a black 96x10 rectangle at position (19, 116).
; PLAN: r0=19(x), r1=116(y), r2=96(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 116
LDI r2, 96
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
