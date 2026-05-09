; DESCRIPTION: Places a cyan 78x38 rectangle at position (49, 77).
; PLAN: r0=49(x), r1=77(y), r2=78(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 77
LDI r2, 78
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
