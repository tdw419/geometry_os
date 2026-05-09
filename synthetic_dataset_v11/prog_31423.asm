; DESCRIPTION: Places a orange 39x78 rectangle at position (30, 22).
; PLAN: r0=30(x), r1=22(y), r2=39(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 22
LDI r2, 39
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
