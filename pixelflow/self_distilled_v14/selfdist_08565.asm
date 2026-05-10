; DESCRIPTION: Places a blue 30x79 box at position (123, 18).
; PLAN: r0=123(x), r1=18(y), r2=30(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 18
LDI r2, 30
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
