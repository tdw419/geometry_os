; DESCRIPTION: Places a yellow 92x101 rectangle at position (216, 66).
; PLAN: r0=216(x), r1=66(y), r2=92(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 66
LDI r2, 92
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
