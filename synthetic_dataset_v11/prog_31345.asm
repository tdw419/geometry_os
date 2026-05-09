; DESCRIPTION: Renders a yellow box of size 51x45 starting at (102, 129).
; PLAN: r0=102(x), r1=129(y), r2=51(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 129
LDI r2, 51
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
