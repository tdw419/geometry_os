; DESCRIPTION: Places a black 95x33 rectangle at position (402, 101).
; PLAN: r0=402(x), r1=101(y), r2=95(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 101
LDI r2, 95
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
