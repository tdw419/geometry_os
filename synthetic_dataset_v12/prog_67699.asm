; DESCRIPTION: Places a blue 66x118 rectangle at position (161, 108).
; PLAN: r0=161(x), r1=108(y), r2=66(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 108
LDI r2, 66
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
