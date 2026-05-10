; DESCRIPTION: Places a magenta 12x70 box at position (287, 142).
; PLAN: r0=287(x), r1=142(y), r2=12(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 142
LDI r2, 12
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
