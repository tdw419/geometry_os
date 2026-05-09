; DESCRIPTION: Places a purple 113x34 rectangle at position (155, 139).
; PLAN: r0=155(x), r1=139(y), r2=113(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 139
LDI r2, 113
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
