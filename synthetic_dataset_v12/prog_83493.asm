; DESCRIPTION: Renders a blue box of size 98x73 starting at (9, 59).
; PLAN: r0=9(x), r1=59(y), r2=98(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 59
LDI r2, 98
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
