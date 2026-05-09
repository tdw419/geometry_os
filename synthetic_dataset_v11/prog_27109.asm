; DESCRIPTION: Renders a yellow box of size 93x31 starting at (111, 182).
; PLAN: r0=111(x), r1=182(y), r2=93(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 182
LDI r2, 93
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
