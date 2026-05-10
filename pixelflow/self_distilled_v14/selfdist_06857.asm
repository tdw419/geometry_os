; DESCRIPTION: Places a white 76x17 box at position (107, 176).
; PLAN: r0=107(x), r1=176(y), r2=76(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 176
LDI r2, 76
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
