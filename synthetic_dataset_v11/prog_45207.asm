; DESCRIPTION: Places a black 57x106 rectangle at position (89, 120).
; PLAN: r0=89(x), r1=120(y), r2=57(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 120
LDI r2, 57
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
