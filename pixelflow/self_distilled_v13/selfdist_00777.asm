; DESCRIPTION: Places a white 82x80 box at position (339, 151).
; PLAN: r0=339(x), r1=151(y), r2=82(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 151
LDI r2, 82
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
