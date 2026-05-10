; DESCRIPTION: Places a black 98x107 rectangle at position (47, 37).
; PLAN: r0=47(x), r1=37(y), r2=98(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 37
LDI r2, 98
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
