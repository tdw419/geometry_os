; DESCRIPTION: Places a black 26x14 rectangle at position (0, 95).
; PLAN: r0=0(x), r1=95(y), r2=26(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 95
LDI r2, 26
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
