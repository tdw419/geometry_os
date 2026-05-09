; DESCRIPTION: Places a red 74x71 rectangle at position (145, 116).
; PLAN: r0=145(x), r1=116(y), r2=74(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 116
LDI r2, 74
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
