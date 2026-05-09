; DESCRIPTION: Places a purple 93x62 rectangle at position (111, 3).
; PLAN: r0=111(x), r1=3(y), r2=93(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 3
LDI r2, 93
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
