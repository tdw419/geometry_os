; DESCRIPTION: Places a yellow 92x40 rectangle at position (142, 68).
; PLAN: r0=142(x), r1=68(y), r2=92(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 68
LDI r2, 92
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
