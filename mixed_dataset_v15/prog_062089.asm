; DESCRIPTION: Renders a purple box of size 31x81 starting at (369, 133).
; PLAN: r0=369(x), r1=133(y), r2=31(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 133
LDI r2, 31
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
