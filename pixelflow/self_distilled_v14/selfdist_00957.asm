; DESCRIPTION: Places a orange 60x15 box at position (250, 49).
; PLAN: r0=250(x), r1=49(y), r2=60(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 49
LDI r2, 60
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
