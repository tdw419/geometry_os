; DESCRIPTION: Creates a cyan filled rectangle of size 11x107 starting at (60, 138).
; PLAN: r0=60(x), r1=138(y), r2=11(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 138
LDI r2, 11
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
