; DESCRIPTION: Creates a cyan filled rectangle of size 89x97 starting at (313, 4).
; PLAN: r0=313(x), r1=4(y), r2=89(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 4
LDI r2, 89
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
