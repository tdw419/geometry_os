; DESCRIPTION: Renders a purple box of size 71x59 starting at (169, 137).
; PLAN: r0=169(x), r1=137(y), r2=71(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 137
LDI r2, 71
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
