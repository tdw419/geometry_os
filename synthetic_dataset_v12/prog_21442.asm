; DESCRIPTION: Places a black 80x98 rectangle at position (142, 12).
; PLAN: r0=142(x), r1=12(y), r2=80(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 12
LDI r2, 80
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
