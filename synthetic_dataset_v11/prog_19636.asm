; DESCRIPTION: Places a orange 96x54 rectangle at position (67, 30).
; PLAN: r0=67(x), r1=30(y), r2=96(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 30
LDI r2, 96
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
