; DESCRIPTION: Places a purple 94x71 rectangle at position (73, 89).
; PLAN: r0=73(x), r1=89(y), r2=94(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 89
LDI r2, 94
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
