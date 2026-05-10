; DESCRIPTION: Creates a cyan filled rectangle of size 86x68 starting at (264, 89).
; PLAN: r0=264(x), r1=89(y), r2=86(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 89
LDI r2, 86
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
