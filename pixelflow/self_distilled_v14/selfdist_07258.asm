; DESCRIPTION: Creates a orange filled rectangle of size 26x112 starting at (154, 179).
; PLAN: r0=154(x), r1=179(y), r2=26(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 179
LDI r2, 26
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
