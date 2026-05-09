; DESCRIPTION: Places a yellow 14x119 rectangle at position (125, 74).
; PLAN: r0=125(x), r1=74(y), r2=14(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 74
LDI r2, 14
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
