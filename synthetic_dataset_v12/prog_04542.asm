; DESCRIPTION: Places a purple 93x46 rectangle at position (233, 49).
; PLAN: r0=233(x), r1=49(y), r2=93(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 49
LDI r2, 93
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
