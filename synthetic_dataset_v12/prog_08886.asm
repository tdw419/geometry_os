; DESCRIPTION: Places a black 16x15 rectangle at position (142, 84).
; PLAN: r0=142(x), r1=84(y), r2=16(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 84
LDI r2, 16
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
