; DESCRIPTION: Places a orange 73x84 rectangle at position (187, 67).
; PLAN: r0=187(x), r1=67(y), r2=73(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 67
LDI r2, 73
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
