; DESCRIPTION: Renders a black box of size 73x93 starting at (73, 60).
; PLAN: r0=73(x), r1=60(y), r2=73(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 60
LDI r2, 73
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
