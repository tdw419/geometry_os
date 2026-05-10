; DESCRIPTION: Places a black 53x61 rectangle at position (377, 112).
; PLAN: r0=377(x), r1=112(y), r2=53(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 112
LDI r2, 53
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
