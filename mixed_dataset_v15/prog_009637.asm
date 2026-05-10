; DESCRIPTION: Places a blue 39x37 box at position (165, 137).
; PLAN: r0=165(x), r1=137(y), r2=39(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 137
LDI r2, 39
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
