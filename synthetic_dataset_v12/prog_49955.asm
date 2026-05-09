; DESCRIPTION: Places a black 49x24 rectangle at position (287, 220).
; PLAN: r0=287(x), r1=220(y), r2=49(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 220
LDI r2, 49
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
