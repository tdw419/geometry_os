; DESCRIPTION: Places a yellow 59x23 rectangle at position (37, 118).
; PLAN: r0=37(x), r1=118(y), r2=59(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 118
LDI r2, 59
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
