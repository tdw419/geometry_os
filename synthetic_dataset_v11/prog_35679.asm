; DESCRIPTION: Places a black 48x54 rectangle at position (122, 122).
; PLAN: r0=122(x), r1=122(y), r2=48(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 122
LDI r2, 48
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
