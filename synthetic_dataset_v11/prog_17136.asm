; DESCRIPTION: Places a black 68x106 rectangle at position (131, 33).
; PLAN: r0=131(x), r1=33(y), r2=68(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 33
LDI r2, 68
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
