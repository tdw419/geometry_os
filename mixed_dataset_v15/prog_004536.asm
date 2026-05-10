; DESCRIPTION: Places a black 82x34 rectangle at position (51, 6).
; PLAN: r0=51(x), r1=6(y), r2=82(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 6
LDI r2, 82
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
