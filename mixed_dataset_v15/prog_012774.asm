; DESCRIPTION: Places a purple 26x110 box at position (130, 177).
; PLAN: r0=130(x), r1=177(y), r2=26(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 177
LDI r2, 26
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
