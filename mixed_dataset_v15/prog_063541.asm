; DESCRIPTION: Creates a cyan filled rectangle of size 87x94 starting at (0, 98).
; PLAN: r0=0(x), r1=98(y), r2=87(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 98
LDI r2, 87
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
