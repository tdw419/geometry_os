; DESCRIPTION: Places a blue 108x51 box at position (215, 79).
; PLAN: r0=215(x), r1=79(y), r2=108(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 79
LDI r2, 108
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
