; DESCRIPTION: Places a orange 118x43 rectangle at position (167, 22).
; PLAN: r0=167(x), r1=22(y), r2=118(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 22
LDI r2, 118
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
