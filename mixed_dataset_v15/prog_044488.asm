; DESCRIPTION: Places a blue 103x94 box at position (15, 198).
; PLAN: r0=15(x), r1=198(y), r2=103(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 198
LDI r2, 103
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
