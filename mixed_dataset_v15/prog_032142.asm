; DESCRIPTION: Places a purple 95x93 rectangle at position (274, 139).
; PLAN: r0=274(x), r1=139(y), r2=95(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 139
LDI r2, 95
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
