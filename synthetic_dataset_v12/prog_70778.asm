; DESCRIPTION: Places a black 12x15 rectangle at position (19, 92).
; PLAN: r0=19(x), r1=92(y), r2=12(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 92
LDI r2, 12
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
