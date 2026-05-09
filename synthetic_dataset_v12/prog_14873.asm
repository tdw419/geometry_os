; DESCRIPTION: Places a orange 67x12 rectangle at position (8, 144).
; PLAN: r0=8(x), r1=144(y), r2=67(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 144
LDI r2, 67
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
