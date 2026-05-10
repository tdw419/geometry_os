; DESCRIPTION: Places a black 53x110 rectangle at position (46, 136).
; PLAN: r0=46(x), r1=136(y), r2=53(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 136
LDI r2, 53
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
