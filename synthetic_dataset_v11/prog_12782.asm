; DESCRIPTION: Places a black 116x96 rectangle at position (79, 36).
; PLAN: r0=79(x), r1=36(y), r2=116(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 36
LDI r2, 116
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
