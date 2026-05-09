; DESCRIPTION: Places a blue 112x98 rectangle at position (385, 97).
; PLAN: r0=385(x), r1=97(y), r2=112(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 97
LDI r2, 112
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
