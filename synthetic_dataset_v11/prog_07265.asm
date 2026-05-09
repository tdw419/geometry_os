; DESCRIPTION: Places a black 28x62 rectangle at position (35, 49).
; PLAN: r0=35(x), r1=49(y), r2=28(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 49
LDI r2, 28
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
