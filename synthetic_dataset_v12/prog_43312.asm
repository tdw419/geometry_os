; DESCRIPTION: Places a cyan 53x74 rectangle at position (343, 155).
; PLAN: r0=343(x), r1=155(y), r2=53(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 155
LDI r2, 53
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
