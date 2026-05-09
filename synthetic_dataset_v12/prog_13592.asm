; DESCRIPTION: Renders a yellow box of size 92x117 starting at (379, 137).
; PLAN: r0=379(x), r1=137(y), r2=92(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 137
LDI r2, 92
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
