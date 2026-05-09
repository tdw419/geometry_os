; DESCRIPTION: Places a orange 67x117 rectangle at position (68, 137).
; PLAN: r0=68(x), r1=137(y), r2=67(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 137
LDI r2, 67
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
