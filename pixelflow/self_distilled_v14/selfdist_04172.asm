; DESCRIPTION: Creates a orange filled rectangle of size 81x43 starting at (200, 128).
; PLAN: r0=200(x), r1=128(y), r2=81(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 128
LDI r2, 81
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
