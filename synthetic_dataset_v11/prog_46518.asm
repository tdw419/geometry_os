; DESCRIPTION: Renders a yellow box of size 78x111 starting at (178, 100).
; PLAN: r0=178(x), r1=100(y), r2=78(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 100
LDI r2, 78
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
