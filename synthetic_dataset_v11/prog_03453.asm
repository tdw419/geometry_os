; DESCRIPTION: Renders a yellow box of size 20x46 starting at (51, 28).
; PLAN: r0=51(x), r1=28(y), r2=20(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 28
LDI r2, 20
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
