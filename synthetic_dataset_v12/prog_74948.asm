; DESCRIPTION: Places a black 14x94 rectangle at position (274, 140).
; PLAN: r0=274(x), r1=140(y), r2=14(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 140
LDI r2, 14
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
