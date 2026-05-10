; DESCRIPTION: Places a white 23x37 box at position (100, 181).
; PLAN: r0=100(x), r1=181(y), r2=23(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 181
LDI r2, 23
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
