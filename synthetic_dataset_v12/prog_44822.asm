; DESCRIPTION: Renders a yellow box of size 92x23 starting at (19, 184).
; PLAN: r0=19(x), r1=184(y), r2=92(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 184
LDI r2, 92
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
