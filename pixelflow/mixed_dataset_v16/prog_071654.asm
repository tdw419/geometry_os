; DESCRIPTION: Places a purple 25x53 rectangle at position (319, 126).
; PLAN: r0=319(x), r1=126(y), r2=25(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 126
LDI r2, 25
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
