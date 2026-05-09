; DESCRIPTION: Places a blue 19x79 rectangle at position (348, 19).
; PLAN: r0=348(x), r1=19(y), r2=19(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 19
LDI r2, 19
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
