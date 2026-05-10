; DESCRIPTION: Places a blue 43x52 box at position (302, 189).
; PLAN: r0=302(x), r1=189(y), r2=43(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 189
LDI r2, 43
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
