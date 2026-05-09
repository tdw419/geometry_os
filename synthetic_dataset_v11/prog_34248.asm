; DESCRIPTION: Places a black 29x58 rectangle at position (20, 148).
; PLAN: r0=20(x), r1=148(y), r2=29(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 148
LDI r2, 29
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
