; DESCRIPTION: Places a black 49x50 rectangle at position (149, 55).
; PLAN: r0=149(x), r1=55(y), r2=49(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 55
LDI r2, 49
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
