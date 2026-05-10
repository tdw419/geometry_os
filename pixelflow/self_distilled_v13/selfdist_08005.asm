; DESCRIPTION: Places a white 49x92 box at position (232, 156).
; PLAN: r0=232(x), r1=156(y), r2=49(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 156
LDI r2, 49
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
