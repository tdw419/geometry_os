; DESCRIPTION: Places a red 47x81 rectangle at position (25, 151).
; PLAN: r0=25(x), r1=151(y), r2=47(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 151
LDI r2, 47
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
