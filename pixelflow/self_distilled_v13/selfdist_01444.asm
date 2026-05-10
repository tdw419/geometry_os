; DESCRIPTION: Places a purple 26x29 box at position (264, 107).
; PLAN: r0=264(x), r1=107(y), r2=26(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 107
LDI r2, 26
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
