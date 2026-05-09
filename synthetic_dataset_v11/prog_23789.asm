; DESCRIPTION: Places a blue 112x94 rectangle at position (3, 44).
; PLAN: r0=3(x), r1=44(y), r2=112(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 44
LDI r2, 112
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
