; DESCRIPTION: Places a purple 57x29 rectangle at position (451, 177).
; PLAN: r0=451(x), r1=177(y), r2=57(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 177
LDI r2, 57
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
