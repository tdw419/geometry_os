; DESCRIPTION: Places a cyan 51x93 rectangle at position (86, 97).
; PLAN: r0=86(x), r1=97(y), r2=51(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 97
LDI r2, 51
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
