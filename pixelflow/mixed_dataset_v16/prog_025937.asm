; DESCRIPTION: Creates a cyan filled rectangle of size 62x83 starting at (242, 78).
; PLAN: r0=242(x), r1=78(y), r2=62(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 78
LDI r2, 62
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
