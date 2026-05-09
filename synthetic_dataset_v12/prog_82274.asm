; DESCRIPTION: Places a red 32x41 rectangle at position (27, 151).
; PLAN: r0=27(x), r1=151(y), r2=32(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 151
LDI r2, 32
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
