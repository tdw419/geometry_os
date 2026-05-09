; DESCRIPTION: Places a purple 102x97 rectangle at position (127, 22).
; PLAN: r0=127(x), r1=22(y), r2=102(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 22
LDI r2, 102
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
