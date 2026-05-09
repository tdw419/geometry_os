; DESCRIPTION: Places a cyan 19x101 rectangle at position (40, 99).
; PLAN: r0=40(x), r1=99(y), r2=19(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 99
LDI r2, 19
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
