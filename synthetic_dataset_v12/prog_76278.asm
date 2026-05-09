; DESCRIPTION: Places a black 110x53 rectangle at position (206, 24).
; PLAN: r0=206(x), r1=24(y), r2=110(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 24
LDI r2, 110
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
