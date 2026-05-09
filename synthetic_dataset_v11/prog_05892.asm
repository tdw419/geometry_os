; DESCRIPTION: Places a black 11x116 rectangle at position (184, 118).
; PLAN: r0=184(x), r1=118(y), r2=11(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 118
LDI r2, 11
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
