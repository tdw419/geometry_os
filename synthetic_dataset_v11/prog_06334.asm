; DESCRIPTION: Places a black 92x83 rectangle at position (81, 73).
; PLAN: r0=81(x), r1=73(y), r2=92(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 73
LDI r2, 92
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
