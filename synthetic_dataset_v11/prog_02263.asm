; DESCRIPTION: Places a cyan 76x83 rectangle at position (35, 151).
; PLAN: r0=35(x), r1=151(y), r2=76(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 151
LDI r2, 76
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
