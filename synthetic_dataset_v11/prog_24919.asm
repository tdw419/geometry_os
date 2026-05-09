; DESCRIPTION: Places a black 36x112 rectangle at position (29, 116).
; PLAN: r0=29(x), r1=116(y), r2=36(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 116
LDI r2, 36
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
