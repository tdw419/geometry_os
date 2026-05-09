; DESCRIPTION: Places a cyan 78x76 rectangle at position (227, 112).
; PLAN: r0=227(x), r1=112(y), r2=78(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 112
LDI r2, 78
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
