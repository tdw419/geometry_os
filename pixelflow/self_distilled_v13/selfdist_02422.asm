; DESCRIPTION: Creates a orange filled rectangle of size 81x104 starting at (356, 114).
; PLAN: r0=356(x), r1=114(y), r2=81(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 114
LDI r2, 81
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
