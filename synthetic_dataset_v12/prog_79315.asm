; DESCRIPTION: Renders a yellow box of size 92x69 starting at (258, 71).
; PLAN: r0=258(x), r1=71(y), r2=92(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 71
LDI r2, 92
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
