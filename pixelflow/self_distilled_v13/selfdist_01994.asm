; DESCRIPTION: Places a white 119x26 box at position (99, 94).
; PLAN: r0=99(x), r1=94(y), r2=119(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 94
LDI r2, 119
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
