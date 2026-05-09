; DESCRIPTION: Places a blue 31x64 rectangle at position (82, 151).
; PLAN: r0=82(x), r1=151(y), r2=31(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 151
LDI r2, 31
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
