; DESCRIPTION: Places a orange 26x56 rectangle at position (58, 57).
; PLAN: r0=58(x), r1=57(y), r2=26(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 57
LDI r2, 26
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
