; DESCRIPTION: Places a magenta 60x44 rectangle at position (348, 116).
; PLAN: r0=348(x), r1=116(y), r2=60(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 116
LDI r2, 60
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
