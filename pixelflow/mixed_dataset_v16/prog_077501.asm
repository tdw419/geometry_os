; DESCRIPTION: Creates a cyan filled rectangle of size 32x76 starting at (174, 19).
; PLAN: r0=174(x), r1=19(y), r2=32(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 19
LDI r2, 32
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
