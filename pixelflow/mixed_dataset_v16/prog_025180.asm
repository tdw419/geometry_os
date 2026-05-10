; DESCRIPTION: Places a black 15x71 rectangle at position (49, 102).
; PLAN: r0=49(x), r1=102(y), r2=15(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 102
LDI r2, 15
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
