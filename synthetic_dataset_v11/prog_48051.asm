; DESCRIPTION: Places a black 88x43 rectangle at position (135, 102).
; PLAN: r0=135(x), r1=102(y), r2=88(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 102
LDI r2, 88
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
