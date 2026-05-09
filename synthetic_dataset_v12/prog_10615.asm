; DESCRIPTION: Places a black 95x49 rectangle at position (172, 141).
; PLAN: r0=172(x), r1=141(y), r2=95(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 141
LDI r2, 95
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
