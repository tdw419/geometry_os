; DESCRIPTION: Places a black 86x33 rectangle at position (323, 131).
; PLAN: r0=323(x), r1=131(y), r2=86(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 131
LDI r2, 86
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
