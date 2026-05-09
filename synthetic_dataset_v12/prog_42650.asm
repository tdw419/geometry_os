; DESCRIPTION: Places a orange 34x67 rectangle at position (229, 5).
; PLAN: r0=229(x), r1=5(y), r2=34(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 5
LDI r2, 34
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
