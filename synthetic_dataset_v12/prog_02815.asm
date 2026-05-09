; DESCRIPTION: Places a black 92x84 rectangle at position (134, 14).
; PLAN: r0=134(x), r1=14(y), r2=92(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 14
LDI r2, 92
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
