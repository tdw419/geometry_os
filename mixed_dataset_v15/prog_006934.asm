; DESCRIPTION: Renders a yellow box of size 51x40 starting at (160, 81).
; PLAN: r0=160(x), r1=81(y), r2=51(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 81
LDI r2, 51
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
