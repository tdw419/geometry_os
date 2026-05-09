; DESCRIPTION: Places a orange 71x114 rectangle at position (178, 101).
; PLAN: r0=178(x), r1=101(y), r2=71(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 101
LDI r2, 71
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
