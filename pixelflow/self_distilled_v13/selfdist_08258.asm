; DESCRIPTION: Creates a orange filled rectangle of size 74x102 starting at (47, 82).
; PLAN: r0=47(x), r1=82(y), r2=74(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 82
LDI r2, 74
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
