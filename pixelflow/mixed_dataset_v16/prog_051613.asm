; DESCRIPTION: Creates a cyan filled rectangle of size 99x97 starting at (238, 103).
; PLAN: r0=238(x), r1=103(y), r2=99(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 103
LDI r2, 99
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
