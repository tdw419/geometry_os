; DESCRIPTION: Places a black 55x69 rectangle at position (291, 127).
; PLAN: r0=291(x), r1=127(y), r2=55(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 127
LDI r2, 55
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
