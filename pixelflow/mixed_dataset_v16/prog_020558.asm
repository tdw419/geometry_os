; DESCRIPTION: Places a orange 55x107 rectangle at position (78, 36).
; PLAN: r0=78(x), r1=36(y), r2=55(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 36
LDI r2, 55
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
