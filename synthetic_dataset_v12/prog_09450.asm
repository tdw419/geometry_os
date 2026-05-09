; DESCRIPTION: Renders a green box of size 55x46 starting at (124, 118).
; PLAN: r0=124(x), r1=118(y), r2=55(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 118
LDI r2, 55
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
