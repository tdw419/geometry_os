; DESCRIPTION: Places a black 32x57 rectangle at position (3, 78).
; PLAN: r0=3(x), r1=78(y), r2=32(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 78
LDI r2, 32
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
