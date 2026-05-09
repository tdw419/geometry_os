; DESCRIPTION: Places a black 92x11 rectangle at position (129, 26).
; PLAN: r0=129(x), r1=26(y), r2=92(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 26
LDI r2, 92
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
