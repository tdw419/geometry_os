; DESCRIPTION: Renders a yellow box of size 111x22 starting at (200, 92).
; PLAN: r0=200(x), r1=92(y), r2=111(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 92
LDI r2, 111
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
