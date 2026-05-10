; DESCRIPTION: Places a blue 18x79 box at position (51, 30).
; PLAN: r0=51(x), r1=30(y), r2=18(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 30
LDI r2, 18
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
