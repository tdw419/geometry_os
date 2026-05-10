; DESCRIPTION: Creates a cyan filled rectangle of size 33x34 starting at (395, 9).
; PLAN: r0=395(x), r1=9(y), r2=33(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 9
LDI r2, 33
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
