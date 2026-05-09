; DESCRIPTION: Renders a yellow box of size 19x111 starting at (185, 55).
; PLAN: r0=185(x), r1=55(y), r2=19(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 55
LDI r2, 19
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
