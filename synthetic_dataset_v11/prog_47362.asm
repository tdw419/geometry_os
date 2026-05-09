; DESCRIPTION: Places a black 38x13 rectangle at position (122, 65).
; PLAN: r0=122(x), r1=65(y), r2=38(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 65
LDI r2, 38
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
