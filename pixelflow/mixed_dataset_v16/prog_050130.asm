; DESCRIPTION: Places a red 105x49 box at position (211, 104).
; PLAN: r0=211(x), r1=104(y), r2=105(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 104
LDI r2, 105
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
