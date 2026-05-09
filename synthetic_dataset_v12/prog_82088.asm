; DESCRIPTION: Places a red 20x31 rectangle at position (215, 151).
; PLAN: r0=215(x), r1=151(y), r2=20(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 151
LDI r2, 20
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
