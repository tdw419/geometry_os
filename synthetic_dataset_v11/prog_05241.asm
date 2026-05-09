; DESCRIPTION: Places a black 69x76 rectangle at position (145, 52).
; PLAN: r0=145(x), r1=52(y), r2=69(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 52
LDI r2, 69
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
