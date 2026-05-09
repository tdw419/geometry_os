; DESCRIPTION: Places a black 59x15 rectangle at position (89, 75).
; PLAN: r0=89(x), r1=75(y), r2=59(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 75
LDI r2, 59
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
