; DESCRIPTION: Renders a blue box of size 46x91 starting at (169, 138).
; PLAN: r0=169(x), r1=138(y), r2=46(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 138
LDI r2, 46
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
