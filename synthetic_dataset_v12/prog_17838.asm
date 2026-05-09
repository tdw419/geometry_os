; DESCRIPTION: Places a black 115x55 rectangle at position (61, 141).
; PLAN: r0=61(x), r1=141(y), r2=115(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 141
LDI r2, 115
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
