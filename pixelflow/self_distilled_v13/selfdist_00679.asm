; DESCRIPTION: Places a purple 28x119 box at position (226, 44).
; PLAN: r0=226(x), r1=44(y), r2=28(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 44
LDI r2, 28
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
