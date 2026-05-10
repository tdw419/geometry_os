; DESCRIPTION: Creates a cyan filled rectangle of size 115x38 starting at (138, 26).
; PLAN: r0=138(x), r1=26(y), r2=115(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 26
LDI r2, 115
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
