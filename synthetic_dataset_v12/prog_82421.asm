; DESCRIPTION: Places a black 93x105 rectangle at position (29, 108).
; PLAN: r0=29(x), r1=108(y), r2=93(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 108
LDI r2, 93
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
