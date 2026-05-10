; DESCRIPTION: Creates a cyan filled rectangle of size 29x49 starting at (157, 24).
; PLAN: r0=157(x), r1=24(y), r2=29(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 24
LDI r2, 29
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
