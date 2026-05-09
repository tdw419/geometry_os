; DESCRIPTION: Places a black 108x83 rectangle at position (11, 92).
; PLAN: r0=11(x), r1=92(y), r2=108(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 92
LDI r2, 108
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
