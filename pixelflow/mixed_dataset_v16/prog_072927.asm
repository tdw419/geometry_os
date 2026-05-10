; DESCRIPTION: Places a cyan 30x114 rectangle at position (6, 49).
; PLAN: r0=6(x), r1=49(y), r2=30(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 49
LDI r2, 30
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
