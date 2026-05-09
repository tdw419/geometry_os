; DESCRIPTION: Places a purple 90x43 rectangle at position (256, 132).
; PLAN: r0=256(x), r1=132(y), r2=90(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 132
LDI r2, 90
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
