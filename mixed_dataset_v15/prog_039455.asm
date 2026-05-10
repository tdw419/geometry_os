; DESCRIPTION: Places a orange 88x30 rectangle at position (306, 25).
; PLAN: r0=306(x), r1=25(y), r2=88(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 25
LDI r2, 88
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
