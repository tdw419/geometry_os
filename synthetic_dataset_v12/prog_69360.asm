; DESCRIPTION: Places a red 47x101 rectangle at position (251, 116).
; PLAN: r0=251(x), r1=116(y), r2=47(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 116
LDI r2, 47
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
