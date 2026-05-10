; DESCRIPTION: Places a orange 74x17 rectangle at position (15, 212).
; PLAN: r0=15(x), r1=212(y), r2=74(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 212
LDI r2, 74
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
