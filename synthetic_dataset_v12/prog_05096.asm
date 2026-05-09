; DESCRIPTION: Places a black 19x58 rectangle at position (178, 168).
; PLAN: r0=178(x), r1=168(y), r2=19(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 168
LDI r2, 19
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
