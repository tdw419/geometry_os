; DESCRIPTION: Places a purple 25x17 rectangle at position (61, 44).
; PLAN: r0=61(x), r1=44(y), r2=25(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 44
LDI r2, 25
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
