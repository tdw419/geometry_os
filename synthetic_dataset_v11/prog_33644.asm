; DESCRIPTION: Places a cyan 36x89 rectangle at position (128, 99).
; PLAN: r0=128(x), r1=99(y), r2=36(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 99
LDI r2, 36
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
