; DESCRIPTION: Places a black 10x20 rectangle at position (122, 194).
; PLAN: r0=122(x), r1=194(y), r2=10(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 194
LDI r2, 10
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
