; DESCRIPTION: Creates a cyan filled rectangle of size 59x89 starting at (189, 160).
; PLAN: r0=189(x), r1=160(y), r2=59(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 160
LDI r2, 59
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
