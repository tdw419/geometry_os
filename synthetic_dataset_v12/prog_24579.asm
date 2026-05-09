; DESCRIPTION: Places a black 69x119 rectangle at position (217, 46).
; PLAN: r0=217(x), r1=46(y), r2=69(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 46
LDI r2, 69
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
