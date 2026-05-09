; DESCRIPTION: Renders a yellow box of size 84x51 starting at (407, 103).
; PLAN: r0=407(x), r1=103(y), r2=84(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 103
LDI r2, 84
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
