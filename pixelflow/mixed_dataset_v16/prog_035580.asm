; DESCRIPTION: Places a blue 49x54 box at position (330, 56).
; PLAN: r0=330(x), r1=56(y), r2=49(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 56
LDI r2, 49
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
