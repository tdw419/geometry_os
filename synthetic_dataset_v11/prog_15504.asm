; DESCRIPTION: Renders a yellow box of size 72x51 starting at (112, 166).
; PLAN: r0=112(x), r1=166(y), r2=72(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 166
LDI r2, 72
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
