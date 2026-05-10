; DESCRIPTION: Creates a cyan filled rectangle of size 24x12 starting at (295, 88).
; PLAN: r0=295(x), r1=88(y), r2=24(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 88
LDI r2, 24
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
