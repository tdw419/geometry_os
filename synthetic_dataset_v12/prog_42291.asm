; DESCRIPTION: Places a black 23x45 rectangle at position (131, 149).
; PLAN: r0=131(x), r1=149(y), r2=23(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 149
LDI r2, 23
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
