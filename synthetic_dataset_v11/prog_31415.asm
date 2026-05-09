; DESCRIPTION: Places a red 74x26 rectangle at position (64, 6).
; PLAN: r0=64(x), r1=6(y), r2=74(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 6
LDI r2, 74
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
