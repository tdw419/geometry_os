; DESCRIPTION: Renders a blue box of size 65x101 starting at (387, 57).
; PLAN: r0=387(x), r1=57(y), r2=65(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 57
LDI r2, 65
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
