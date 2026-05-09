; DESCRIPTION: Places a red 116x78 rectangle at position (19, 145).
; PLAN: r0=19(x), r1=145(y), r2=116(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 145
LDI r2, 116
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
