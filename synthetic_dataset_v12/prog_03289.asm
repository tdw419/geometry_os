; DESCRIPTION: Places a black 66x74 rectangle at position (333, 24).
; PLAN: r0=333(x), r1=24(y), r2=66(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 24
LDI r2, 66
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
