; DESCRIPTION: Places a black 54x119 rectangle at position (274, 94).
; PLAN: r0=274(x), r1=94(y), r2=54(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 94
LDI r2, 54
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
