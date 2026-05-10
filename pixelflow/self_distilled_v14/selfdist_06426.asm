; DESCRIPTION: Creates a cyan filled rectangle of size 44x67 starting at (64, 122).
; PLAN: r0=64(x), r1=122(y), r2=44(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 122
LDI r2, 44
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
