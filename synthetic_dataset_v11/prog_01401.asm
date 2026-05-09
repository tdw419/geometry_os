; DESCRIPTION: Places a black 93x45 rectangle at position (84, 121).
; PLAN: r0=84(x), r1=121(y), r2=93(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 121
LDI r2, 93
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
