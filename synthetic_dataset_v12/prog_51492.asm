; DESCRIPTION: Places a black 82x119 rectangle at position (108, 5).
; PLAN: r0=108(x), r1=5(y), r2=82(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 5
LDI r2, 82
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
