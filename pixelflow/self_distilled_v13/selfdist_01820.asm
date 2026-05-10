; DESCRIPTION: Places a blue 107x112 box at position (147, 151).
; PLAN: r0=147(x), r1=151(y), r2=107(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 151
LDI r2, 107
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
