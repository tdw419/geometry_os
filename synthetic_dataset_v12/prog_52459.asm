; DESCRIPTION: Renders a yellow box of size 65x111 starting at (142, 60).
; PLAN: r0=142(x), r1=60(y), r2=65(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 60
LDI r2, 65
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
