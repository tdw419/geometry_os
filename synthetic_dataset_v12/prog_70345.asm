; DESCRIPTION: Renders a yellow box of size 120x93 starting at (51, 87).
; PLAN: r0=51(x), r1=87(y), r2=120(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 87
LDI r2, 120
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
