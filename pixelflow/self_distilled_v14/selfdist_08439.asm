; DESCRIPTION: Places a white 107x75 box at position (314, 128).
; PLAN: r0=314(x), r1=128(y), r2=107(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 128
LDI r2, 107
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
