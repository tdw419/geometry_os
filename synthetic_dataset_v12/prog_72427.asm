; DESCRIPTION: Places a purple 26x79 rectangle at position (127, 24).
; PLAN: r0=127(x), r1=24(y), r2=26(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 24
LDI r2, 26
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
