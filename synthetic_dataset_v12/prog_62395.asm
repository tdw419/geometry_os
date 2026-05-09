; DESCRIPTION: Places a cyan 22x118 rectangle at position (421, 64).
; PLAN: r0=421(x), r1=64(y), r2=22(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 64
LDI r2, 22
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
