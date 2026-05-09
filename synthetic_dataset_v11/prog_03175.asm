; DESCRIPTION: Places a cyan 64x38 rectangle at position (45, 151).
; PLAN: r0=45(x), r1=151(y), r2=64(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 151
LDI r2, 64
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
