; DESCRIPTION: Places a black 116x105 rectangle at position (47, 12).
; PLAN: r0=47(x), r1=12(y), r2=116(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 12
LDI r2, 116
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
