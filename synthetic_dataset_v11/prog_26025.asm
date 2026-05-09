; DESCRIPTION: Places a orange 79x88 rectangle at position (76, 53).
; PLAN: r0=76(x), r1=53(y), r2=79(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 53
LDI r2, 79
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
