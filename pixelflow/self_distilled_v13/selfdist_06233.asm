; DESCRIPTION: Creates a cyan filled rectangle of size 97x30 starting at (25, 140).
; PLAN: r0=25(x), r1=140(y), r2=97(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 140
LDI r2, 97
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
