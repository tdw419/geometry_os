; DESCRIPTION: Places a black 12x10 rectangle at position (351, 19).
; PLAN: r0=351(x), r1=19(y), r2=12(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 19
LDI r2, 12
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
