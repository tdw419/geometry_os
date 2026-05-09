; DESCRIPTION: Renders a yellow box of size 101x56 starting at (162, 51).
; PLAN: r0=162(x), r1=51(y), r2=101(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 51
LDI r2, 101
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
