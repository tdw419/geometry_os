; DESCRIPTION: Creates a orange filled rectangle of size 53x55 starting at (107, 101).
; PLAN: r0=107(x), r1=101(y), r2=53(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 101
LDI r2, 53
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
