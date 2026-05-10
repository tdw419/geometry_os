; DESCRIPTION: Places a green 112x84 box at position (303, 53).
; PLAN: r0=303(x), r1=53(y), r2=112(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 53
LDI r2, 112
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
