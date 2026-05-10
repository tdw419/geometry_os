; DESCRIPTION: Places a orange 101x67 box at position (73, 35).
; PLAN: r0=73(x), r1=35(y), r2=101(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 35
LDI r2, 101
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
