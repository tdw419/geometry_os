; DESCRIPTION: Places a orange 31x110 rectangle at position (328, 67).
; PLAN: r0=328(x), r1=67(y), r2=31(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 67
LDI r2, 31
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
