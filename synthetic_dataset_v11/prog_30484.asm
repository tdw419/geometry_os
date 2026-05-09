; DESCRIPTION: Places a red 19x83 rectangle at position (203, 61).
; PLAN: r0=203(x), r1=61(y), r2=19(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 61
LDI r2, 19
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
