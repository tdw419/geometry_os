; DESCRIPTION: Renders a cyan box of size 34x89 starting at (463, 78).
; PLAN: r0=463(x), r1=78(y), r2=34(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 78
LDI r2, 34
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
