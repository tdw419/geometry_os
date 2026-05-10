; DESCRIPTION: Places a cyan 49x29 box at position (122, 191).
; PLAN: r0=122(x), r1=191(y), r2=49(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 191
LDI r2, 49
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
