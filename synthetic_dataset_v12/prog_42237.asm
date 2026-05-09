; DESCRIPTION: Renders a blue box of size 10x57 starting at (59, 108).
; PLAN: r0=59(x), r1=108(y), r2=10(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 108
LDI r2, 10
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
