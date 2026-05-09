; DESCRIPTION: Places a orange 78x92 rectangle at position (67, 48).
; PLAN: r0=67(x), r1=48(y), r2=78(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 48
LDI r2, 78
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
