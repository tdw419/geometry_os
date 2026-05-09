; DESCRIPTION: Places a yellow 93x26 rectangle at position (339, 217).
; PLAN: r0=339(x), r1=217(y), r2=93(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 217
LDI r2, 93
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
