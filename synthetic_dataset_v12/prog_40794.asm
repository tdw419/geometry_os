; DESCRIPTION: Places a purple 50x43 rectangle at position (7, 127).
; PLAN: r0=7(x), r1=127(y), r2=50(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 127
LDI r2, 50
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
