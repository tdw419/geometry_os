; DESCRIPTION: Places a purple 29x72 box at position (267, 155).
; PLAN: r0=267(x), r1=155(y), r2=29(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 155
LDI r2, 29
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
