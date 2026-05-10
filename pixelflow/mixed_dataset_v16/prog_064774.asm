; DESCRIPTION: Creates a cyan filled rectangle of size 49x24 starting at (93, 103).
; PLAN: r0=93(x), r1=103(y), r2=49(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 103
LDI r2, 49
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
