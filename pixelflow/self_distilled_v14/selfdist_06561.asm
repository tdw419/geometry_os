; DESCRIPTION: Creates a cyan filled rectangle of size 95x29 starting at (93, 183).
; PLAN: r0=93(x), r1=183(y), r2=95(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 183
LDI r2, 95
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
