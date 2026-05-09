; DESCRIPTION: Places a cyan 117x114 rectangle at position (358, 64).
; PLAN: r0=358(x), r1=64(y), r2=117(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 64
LDI r2, 117
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
