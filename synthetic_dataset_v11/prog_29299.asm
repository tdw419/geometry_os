; DESCRIPTION: Places a purple 97x18 rectangle at position (153, 193).
; PLAN: r0=153(x), r1=193(y), r2=97(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 193
LDI r2, 97
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
