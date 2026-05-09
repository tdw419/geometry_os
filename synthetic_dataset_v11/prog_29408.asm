; DESCRIPTION: Places a black 26x51 rectangle at position (1, 26).
; PLAN: r0=1(x), r1=26(y), r2=26(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 26
LDI r2, 26
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
