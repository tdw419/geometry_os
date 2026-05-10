; DESCRIPTION: Places a cyan 76x113 box at position (343, 149).
; PLAN: r0=343(x), r1=149(y), r2=76(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 149
LDI r2, 76
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
