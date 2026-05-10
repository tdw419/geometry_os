; DESCRIPTION: Places a purple 43x25 box at position (297, 28).
; PLAN: r0=297(x), r1=28(y), r2=43(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 28
LDI r2, 43
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
