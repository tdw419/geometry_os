; DESCRIPTION: Renders a yellow box of size 92x10 starting at (88, 166).
; PLAN: r0=88(x), r1=166(y), r2=92(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 166
LDI r2, 92
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
