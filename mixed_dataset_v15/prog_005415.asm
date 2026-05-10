; DESCRIPTION: Creates a cyan filled rectangle of size 83x93 starting at (119, 90).
; PLAN: r0=119(x), r1=90(y), r2=83(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 90
LDI r2, 83
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
