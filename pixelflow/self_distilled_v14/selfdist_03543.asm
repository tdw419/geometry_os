; DESCRIPTION: Creates a cyan filled rectangle of size 25x107 starting at (12, 59).
; PLAN: r0=12(x), r1=59(y), r2=25(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 59
LDI r2, 25
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
