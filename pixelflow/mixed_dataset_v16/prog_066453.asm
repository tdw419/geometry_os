; DESCRIPTION: Creates a orange filled rectangle of size 51x38 starting at (10, 116).
; PLAN: r0=10(x), r1=116(y), r2=51(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 116
LDI r2, 51
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
