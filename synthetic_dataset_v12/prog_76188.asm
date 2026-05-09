; DESCRIPTION: Renders a yellow box of size 98x38 starting at (51, 60).
; PLAN: r0=51(x), r1=60(y), r2=98(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 60
LDI r2, 98
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
