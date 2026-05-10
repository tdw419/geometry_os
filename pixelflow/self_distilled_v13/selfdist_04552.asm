; DESCRIPTION: Places a blue 99x60 box at position (287, 31).
; PLAN: r0=287(x), r1=31(y), r2=99(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 31
LDI r2, 99
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
