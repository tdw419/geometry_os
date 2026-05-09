; DESCRIPTION: Places a yellow 101x85 rectangle at position (155, 161).
; PLAN: r0=155(x), r1=161(y), r2=101(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 161
LDI r2, 101
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
