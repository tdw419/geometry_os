; DESCRIPTION: Renders a yellow box of size 36x53 starting at (51, 107).
; PLAN: r0=51(x), r1=107(y), r2=36(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 107
LDI r2, 36
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
