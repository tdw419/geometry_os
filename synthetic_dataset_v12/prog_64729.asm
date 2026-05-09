; DESCRIPTION: Renders a yellow box of size 111x92 starting at (226, 141).
; PLAN: r0=226(x), r1=141(y), r2=111(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 141
LDI r2, 111
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
