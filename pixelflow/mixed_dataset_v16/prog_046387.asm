; DESCRIPTION: Places a black 82x114 rectangle at position (331, 36).
; PLAN: r0=331(x), r1=36(y), r2=82(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 36
LDI r2, 82
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
