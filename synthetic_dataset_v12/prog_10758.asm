; DESCRIPTION: Places a cyan 49x118 rectangle at position (3, 36).
; PLAN: r0=3(x), r1=36(y), r2=49(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 36
LDI r2, 49
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
