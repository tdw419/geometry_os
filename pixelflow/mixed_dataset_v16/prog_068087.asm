; DESCRIPTION: Creates a cyan filled rectangle of size 79x76 starting at (182, 102).
; PLAN: r0=182(x), r1=102(y), r2=79(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 102
LDI r2, 79
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
