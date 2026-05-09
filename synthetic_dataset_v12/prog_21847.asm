; DESCRIPTION: Places a cyan 56x119 rectangle at position (343, 43).
; PLAN: r0=343(x), r1=43(y), r2=56(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 43
LDI r2, 56
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
