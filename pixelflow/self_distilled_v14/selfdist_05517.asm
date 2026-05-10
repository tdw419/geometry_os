; DESCRIPTION: Creates a cyan filled rectangle of size 67x98 starting at (231, 36).
; PLAN: r0=231(x), r1=36(y), r2=67(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 36
LDI r2, 67
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
