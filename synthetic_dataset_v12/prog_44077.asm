; DESCRIPTION: Places a black 17x17 rectangle at position (354, 168).
; PLAN: r0=354(x), r1=168(y), r2=17(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 168
LDI r2, 17
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
