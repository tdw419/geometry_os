; DESCRIPTION: Creates a cyan filled rectangle of size 70x68 starting at (301, 80).
; PLAN: r0=301(x), r1=80(y), r2=70(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 80
LDI r2, 70
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
