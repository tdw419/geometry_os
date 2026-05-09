; DESCRIPTION: Places a cyan 23x61 rectangle at position (86, 52).
; PLAN: r0=86(x), r1=52(y), r2=23(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 52
LDI r2, 23
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
