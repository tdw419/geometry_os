; DESCRIPTION: Places a purple 100x28 rectangle at position (369, 84).
; PLAN: r0=369(x), r1=84(y), r2=100(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 84
LDI r2, 100
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
