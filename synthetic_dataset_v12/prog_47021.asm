; DESCRIPTION: Places a orange 74x56 rectangle at position (203, 189).
; PLAN: r0=203(x), r1=189(y), r2=74(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 189
LDI r2, 74
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
