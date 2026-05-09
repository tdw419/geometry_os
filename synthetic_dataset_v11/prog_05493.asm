; DESCRIPTION: Places a black 55x49 rectangle at position (43, 108).
; PLAN: r0=43(x), r1=108(y), r2=55(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 108
LDI r2, 55
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
