; DESCRIPTION: Places a red 14x72 rectangle at position (338, 116).
; PLAN: r0=338(x), r1=116(y), r2=14(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 116
LDI r2, 14
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
