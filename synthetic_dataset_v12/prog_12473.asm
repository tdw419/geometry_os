; DESCRIPTION: Places a orange 46x61 rectangle at position (203, 88).
; PLAN: r0=203(x), r1=88(y), r2=46(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 88
LDI r2, 46
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
