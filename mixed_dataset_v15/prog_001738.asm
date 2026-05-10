; DESCRIPTION: Creates a cyan filled rectangle of size 13x73 starting at (209, 128).
; PLAN: r0=209(x), r1=128(y), r2=13(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 128
LDI r2, 13
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
