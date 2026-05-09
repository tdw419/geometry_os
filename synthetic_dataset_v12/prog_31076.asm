; DESCRIPTION: Places a black 99x89 rectangle at position (379, 135).
; PLAN: r0=379(x), r1=135(y), r2=99(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 135
LDI r2, 99
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
