; DESCRIPTION: Renders a blue box of size 97x65 starting at (133, 48).
; PLAN: r0=133(x), r1=48(y), r2=97(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 48
LDI r2, 97
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
