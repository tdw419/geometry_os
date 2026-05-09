; DESCRIPTION: Places a orange 77x49 rectangle at position (247, 172).
; PLAN: r0=247(x), r1=172(y), r2=77(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 172
LDI r2, 77
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
