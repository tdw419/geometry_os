; DESCRIPTION: Places a black 86x21 rectangle at position (62, 17).
; PLAN: r0=62(x), r1=17(y), r2=86(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 17
LDI r2, 86
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
