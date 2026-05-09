; DESCRIPTION: Places a purple 112x90 rectangle at position (260, 122).
; PLAN: r0=260(x), r1=122(y), r2=112(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 122
LDI r2, 112
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
