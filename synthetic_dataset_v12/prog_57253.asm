; DESCRIPTION: Places a black 83x85 rectangle at position (312, 71).
; PLAN: r0=312(x), r1=71(y), r2=83(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 71
LDI r2, 83
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
