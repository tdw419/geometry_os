; DESCRIPTION: Places a blue 89x108 box at position (215, 5).
; PLAN: r0=215(x), r1=5(y), r2=89(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 5
LDI r2, 89
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
