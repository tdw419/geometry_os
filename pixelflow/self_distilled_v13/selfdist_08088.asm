; DESCRIPTION: Places a red 110x18 box at position (49, 100).
; PLAN: r0=49(x), r1=100(y), r2=110(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 100
LDI r2, 110
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
