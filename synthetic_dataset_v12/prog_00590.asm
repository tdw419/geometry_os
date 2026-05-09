; DESCRIPTION: Places a orange 88x103 rectangle at position (219, 81).
; PLAN: r0=219(x), r1=81(y), r2=88(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 81
LDI r2, 88
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
