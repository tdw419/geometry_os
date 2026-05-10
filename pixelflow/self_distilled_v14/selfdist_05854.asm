; DESCRIPTION: Creates a orange filled rectangle of size 74x107 starting at (116, 172).
; PLAN: r0=116(x), r1=172(y), r2=74(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 172
LDI r2, 74
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
