; DESCRIPTION: Creates a cyan filled rectangle of size 15x105 starting at (343, 32).
; PLAN: r0=343(x), r1=32(y), r2=15(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 32
LDI r2, 15
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
