; DESCRIPTION: Places a purple 71x96 box at position (342, 137).
; PLAN: r0=342(x), r1=137(y), r2=71(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 137
LDI r2, 71
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
