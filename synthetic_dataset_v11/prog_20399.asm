; DESCRIPTION: Places a black 17x66 rectangle at position (183, 138).
; PLAN: r0=183(x), r1=138(y), r2=17(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 138
LDI r2, 17
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
