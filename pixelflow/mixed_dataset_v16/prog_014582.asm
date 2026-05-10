; DESCRIPTION: Places a yellow 29x34 rectangle at position (377, 114).
; PLAN: r0=377(x), r1=114(y), r2=29(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 114
LDI r2, 29
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
