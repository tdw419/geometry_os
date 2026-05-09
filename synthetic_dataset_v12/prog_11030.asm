; DESCRIPTION: Places a black 18x70 rectangle at position (407, 133).
; PLAN: r0=407(x), r1=133(y), r2=18(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 133
LDI r2, 18
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
