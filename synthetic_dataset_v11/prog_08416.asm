; DESCRIPTION: Places a black 108x17 rectangle at position (7, 185).
; PLAN: r0=7(x), r1=185(y), r2=108(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 185
LDI r2, 108
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
