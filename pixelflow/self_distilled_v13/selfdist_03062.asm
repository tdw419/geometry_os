; DESCRIPTION: Creates a green filled rectangle of size 102x31 starting at (76, 107).
; PLAN: r0=76(x), r1=107(y), r2=102(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 107
LDI r2, 102
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
