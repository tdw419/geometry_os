; DESCRIPTION: Creates a cyan filled rectangle of size 38x61 starting at (8, 93).
; PLAN: r0=8(x), r1=93(y), r2=38(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 93
LDI r2, 38
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
