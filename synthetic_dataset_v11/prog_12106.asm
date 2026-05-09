; DESCRIPTION: Places a black 82x43 rectangle at position (9, 23).
; PLAN: r0=9(x), r1=23(y), r2=82(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 23
LDI r2, 82
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
