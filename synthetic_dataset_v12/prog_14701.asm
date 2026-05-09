; DESCRIPTION: Renders a yellow box of size 44x51 starting at (453, 199).
; PLAN: r0=453(x), r1=199(y), r2=44(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 199
LDI r2, 44
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
