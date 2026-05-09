; DESCRIPTION: Places a purple 40x31 rectangle at position (106, 127).
; PLAN: r0=106(x), r1=127(y), r2=40(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 127
LDI r2, 40
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
