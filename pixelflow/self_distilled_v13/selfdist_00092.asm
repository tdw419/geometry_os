; DESCRIPTION: Creates a green filled rectangle of size 38x30 starting at (343, 154).
; PLAN: r0=343(x), r1=154(y), r2=38(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 154
LDI r2, 38
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
