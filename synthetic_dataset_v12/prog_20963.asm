; DESCRIPTION: Places a yellow 119x35 rectangle at position (175, 163).
; PLAN: r0=175(x), r1=163(y), r2=119(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 163
LDI r2, 119
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
