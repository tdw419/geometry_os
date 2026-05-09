; DESCRIPTION: Places a black 43x103 rectangle at position (43, 35).
; PLAN: r0=43(x), r1=35(y), r2=43(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 35
LDI r2, 43
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
