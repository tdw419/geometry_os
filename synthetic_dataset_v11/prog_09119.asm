; DESCRIPTION: Places a black 49x79 rectangle at position (168, 18).
; PLAN: r0=168(x), r1=18(y), r2=49(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 18
LDI r2, 49
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
