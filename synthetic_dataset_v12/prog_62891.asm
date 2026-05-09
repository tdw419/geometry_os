; DESCRIPTION: Places a cyan 97x107 rectangle at position (26, 18).
; PLAN: r0=26(x), r1=18(y), r2=97(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 18
LDI r2, 97
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
