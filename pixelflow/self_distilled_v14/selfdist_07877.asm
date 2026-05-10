; DESCRIPTION: Creates a orange filled rectangle of size 62x55 starting at (133, 60).
; PLAN: r0=133(x), r1=60(y), r2=62(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 60
LDI r2, 62
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
