; DESCRIPTION: Places a purple 83x47 box at position (53, 34).
; PLAN: r0=53(x), r1=34(y), r2=83(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 34
LDI r2, 83
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
