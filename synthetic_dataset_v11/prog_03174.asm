; DESCRIPTION: Renders a purple box of size 39x102 starting at (135, 78).
; PLAN: r0=135(x), r1=78(y), r2=39(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 78
LDI r2, 39
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
