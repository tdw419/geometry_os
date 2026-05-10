; DESCRIPTION: Places a cyan 49x29 box at position (26, 2).
; PLAN: r0=26(x), r1=2(y), r2=49(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 2
LDI r2, 49
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
