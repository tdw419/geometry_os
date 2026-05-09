; DESCRIPTION: Places a purple 29x19 rectangle at position (141, 231).
; PLAN: r0=141(x), r1=231(y), r2=29(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 231
LDI r2, 29
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
