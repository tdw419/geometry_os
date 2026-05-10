; DESCRIPTION: Places a white 31x94 box at position (25, 156).
; PLAN: r0=25(x), r1=156(y), r2=31(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 156
LDI r2, 31
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
