; DESCRIPTION: Places a blue 98x54 box at position (359, 66).
; PLAN: r0=359(x), r1=66(y), r2=98(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 66
LDI r2, 98
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
