; DESCRIPTION: Places a black 75x12 rectangle at position (181, 123).
; PLAN: r0=181(x), r1=123(y), r2=75(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 123
LDI r2, 75
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
