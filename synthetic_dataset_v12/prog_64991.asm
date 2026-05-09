; DESCRIPTION: Places a black 93x36 rectangle at position (396, 218).
; PLAN: r0=396(x), r1=218(y), r2=93(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 218
LDI r2, 93
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
