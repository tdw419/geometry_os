; DESCRIPTION: Places a black 55x19 rectangle at position (86, 69).
; PLAN: r0=86(x), r1=69(y), r2=55(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 69
LDI r2, 55
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
