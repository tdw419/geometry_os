; DESCRIPTION: Renders a yellow box of size 102x51 starting at (135, 119).
; PLAN: r0=135(x), r1=119(y), r2=102(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 119
LDI r2, 102
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
