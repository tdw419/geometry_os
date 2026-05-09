; DESCRIPTION: Places a orange 108x74 rectangle at position (99, 162).
; PLAN: r0=99(x), r1=162(y), r2=108(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 162
LDI r2, 108
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
