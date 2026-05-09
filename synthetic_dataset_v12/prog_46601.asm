; DESCRIPTION: Places a black 112x13 rectangle at position (225, 168).
; PLAN: r0=225(x), r1=168(y), r2=112(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 168
LDI r2, 112
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
