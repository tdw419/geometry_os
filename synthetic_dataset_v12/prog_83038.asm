; DESCRIPTION: Places a black 73x88 rectangle at position (229, 116).
; PLAN: r0=229(x), r1=116(y), r2=73(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 116
LDI r2, 73
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
