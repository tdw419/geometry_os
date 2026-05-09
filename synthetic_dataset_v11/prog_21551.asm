; DESCRIPTION: Places a black 17x72 rectangle at position (27, 58).
; PLAN: r0=27(x), r1=58(y), r2=17(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 58
LDI r2, 17
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
