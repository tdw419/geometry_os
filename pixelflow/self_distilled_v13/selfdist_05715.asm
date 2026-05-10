; DESCRIPTION: Places a cyan 105x89 box at position (52, 57).
; PLAN: r0=52(x), r1=57(y), r2=105(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 57
LDI r2, 105
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
