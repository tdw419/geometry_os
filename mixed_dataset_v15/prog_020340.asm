; DESCRIPTION: Places a black 36x116 rectangle at position (319, 45).
; PLAN: r0=319(x), r1=45(y), r2=36(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 45
LDI r2, 36
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
