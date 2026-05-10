; DESCRIPTION: Places a orange 32x67 rectangle at position (248, 89).
; PLAN: r0=248(x), r1=89(y), r2=32(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 89
LDI r2, 32
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
