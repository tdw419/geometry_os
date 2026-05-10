; DESCRIPTION: Places a black 115x103 rectangle at position (321, 19).
; PLAN: r0=321(x), r1=19(y), r2=115(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 19
LDI r2, 115
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
