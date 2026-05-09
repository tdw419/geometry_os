; DESCRIPTION: Places a orange 21x114 rectangle at position (209, 98).
; PLAN: r0=209(x), r1=98(y), r2=21(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 98
LDI r2, 21
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
