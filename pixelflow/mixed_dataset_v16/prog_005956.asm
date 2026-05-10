; DESCRIPTION: Places a blue 40x105 box at position (361, 79).
; PLAN: r0=361(x), r1=79(y), r2=40(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 79
LDI r2, 40
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
