; DESCRIPTION: Creates a cyan filled rectangle of size 15x32 starting at (126, 57).
; PLAN: r0=126(x), r1=57(y), r2=15(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 57
LDI r2, 15
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
