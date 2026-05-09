; DESCRIPTION: Renders a yellow box of size 92x82 starting at (137, 15).
; PLAN: r0=137(x), r1=15(y), r2=92(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 15
LDI r2, 92
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
