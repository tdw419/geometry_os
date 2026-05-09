; DESCRIPTION: Places a orange 75x67 rectangle at position (119, 168).
; PLAN: r0=119(x), r1=168(y), r2=75(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 168
LDI r2, 75
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
