; DESCRIPTION: Places a black 58x57 rectangle at position (206, 22).
; PLAN: r0=206(x), r1=22(y), r2=58(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 22
LDI r2, 58
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
