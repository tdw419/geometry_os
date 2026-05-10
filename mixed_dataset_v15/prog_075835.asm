; DESCRIPTION: Places a yellow 100x93 box at position (209, 139).
; PLAN: r0=209(x), r1=139(y), r2=100(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 139
LDI r2, 100
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
