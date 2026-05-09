; DESCRIPTION: Places a black 96x23 rectangle at position (182, 69).
; PLAN: r0=182(x), r1=69(y), r2=96(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 69
LDI r2, 96
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
