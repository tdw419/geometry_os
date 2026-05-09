; DESCRIPTION: Places a black 77x45 rectangle at position (143, 167).
; PLAN: r0=143(x), r1=167(y), r2=77(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 167
LDI r2, 77
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
