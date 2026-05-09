; DESCRIPTION: Places a black 103x95 rectangle at position (343, 1).
; PLAN: r0=343(x), r1=1(y), r2=103(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 1
LDI r2, 103
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
