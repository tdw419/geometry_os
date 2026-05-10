; DESCRIPTION: Places a orange 17x45 box at position (372, 66).
; PLAN: r0=372(x), r1=66(y), r2=17(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 66
LDI r2, 17
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
