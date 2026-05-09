; DESCRIPTION: Renders a yellow box of size 112x34 starting at (92, 137).
; PLAN: r0=92(x), r1=137(y), r2=112(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 137
LDI r2, 112
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
