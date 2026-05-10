; DESCRIPTION: Places a orange 118x40 rectangle at position (102, 26).
; PLAN: r0=102(x), r1=26(y), r2=118(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 26
LDI r2, 118
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
