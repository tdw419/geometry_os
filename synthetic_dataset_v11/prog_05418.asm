; DESCRIPTION: Places a black 57x74 rectangle at position (178, 87).
; PLAN: r0=178(x), r1=87(y), r2=57(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 87
LDI r2, 57
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
