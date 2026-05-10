; DESCRIPTION: Places a white 87x39 box at position (339, 107).
; PLAN: r0=339(x), r1=107(y), r2=87(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 107
LDI r2, 87
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
