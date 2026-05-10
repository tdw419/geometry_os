; DESCRIPTION: Places a white 62x102 box at position (276, 122).
; PLAN: r0=276(x), r1=122(y), r2=62(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 122
LDI r2, 62
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
