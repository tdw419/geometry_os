; DESCRIPTION: Places a orange 119x67 rectangle at position (120, 179).
; PLAN: r0=120(x), r1=179(y), r2=119(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 179
LDI r2, 119
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
