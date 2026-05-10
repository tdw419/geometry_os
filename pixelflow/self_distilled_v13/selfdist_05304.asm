; DESCRIPTION: Creates a cyan filled rectangle of size 14x75 starting at (215, 18).
; PLAN: r0=215(x), r1=18(y), r2=14(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 18
LDI r2, 14
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
