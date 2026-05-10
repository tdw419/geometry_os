; DESCRIPTION: Places a orange 55x88 rectangle at position (316, 132).
; PLAN: r0=316(x), r1=132(y), r2=55(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 132
LDI r2, 55
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
