; DESCRIPTION: Renders a yellow box of size 16x51 starting at (102, 137).
; PLAN: r0=102(x), r1=137(y), r2=16(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 137
LDI r2, 16
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
