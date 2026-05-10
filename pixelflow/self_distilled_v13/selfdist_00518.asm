; DESCRIPTION: Creates a cyan filled rectangle of size 76x69 starting at (20, 192).
; PLAN: r0=20(x), r1=192(y), r2=76(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 192
LDI r2, 76
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
