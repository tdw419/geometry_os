; DESCRIPTION: Renders a yellow box of size 51x87 starting at (161, 132).
; PLAN: r0=161(x), r1=132(y), r2=51(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 132
LDI r2, 51
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
