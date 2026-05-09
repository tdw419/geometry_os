; DESCRIPTION: Places a white 86x114 rectangle at position (64, 3).
; PLAN: r0=64(x), r1=3(y), r2=86(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 3
LDI r2, 86
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
