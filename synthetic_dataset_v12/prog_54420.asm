; DESCRIPTION: Places a black 83x44 rectangle at position (421, 23).
; PLAN: r0=421(x), r1=23(y), r2=83(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 23
LDI r2, 83
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
