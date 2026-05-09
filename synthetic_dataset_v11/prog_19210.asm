; DESCRIPTION: Renders a red box of size 22x105 starting at (55, 112).
; PLAN: r0=55(x), r1=112(y), r2=22(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 112
LDI r2, 22
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
