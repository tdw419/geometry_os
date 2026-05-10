; DESCRIPTION: Renders a blue box of size 72x94 starting at (431, 59).
; PLAN: r0=431(x), r1=59(y), r2=72(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 59
LDI r2, 72
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
