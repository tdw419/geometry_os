; DESCRIPTION: Places a blue 41x118 rectangle at position (37, 48).
; PLAN: r0=37(x), r1=48(y), r2=41(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 48
LDI r2, 41
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
