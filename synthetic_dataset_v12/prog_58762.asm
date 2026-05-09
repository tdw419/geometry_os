; DESCRIPTION: Renders a yellow box of size 106x111 starting at (38, 39).
; PLAN: r0=38(x), r1=39(y), r2=106(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 39
LDI r2, 106
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
