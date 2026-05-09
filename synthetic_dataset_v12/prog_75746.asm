; DESCRIPTION: Places a red 12x114 rectangle at position (348, 8).
; PLAN: r0=348(x), r1=8(y), r2=12(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 8
LDI r2, 12
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
