; DESCRIPTION: Places a orange 65x109 rectangle at position (99, 67).
; PLAN: r0=99(x), r1=67(y), r2=65(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 67
LDI r2, 65
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
