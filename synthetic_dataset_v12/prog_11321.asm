; DESCRIPTION: Places a cyan 87x91 rectangle at position (207, 151).
; PLAN: r0=207(x), r1=151(y), r2=87(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 151
LDI r2, 87
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
