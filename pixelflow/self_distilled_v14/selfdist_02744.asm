; DESCRIPTION: Places a blue 74x25 box at position (215, 84).
; PLAN: r0=215(x), r1=84(y), r2=74(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 84
LDI r2, 74
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
