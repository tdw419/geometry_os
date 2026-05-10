; DESCRIPTION: Creates a cyan filled rectangle of size 110x114 starting at (41, 124).
; PLAN: r0=41(x), r1=124(y), r2=110(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 124
LDI r2, 110
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
