; DESCRIPTION: Creates a cyan filled rectangle of size 91x117 starting at (89, 7).
; PLAN: r0=89(x), r1=7(y), r2=91(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 7
LDI r2, 91
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
