; DESCRIPTION: Places a red 17x106 rectangle at position (276, 63).
; PLAN: r0=276(x), r1=63(y), r2=17(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 63
LDI r2, 17
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
