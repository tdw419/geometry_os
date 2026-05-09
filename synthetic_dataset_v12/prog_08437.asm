; DESCRIPTION: Renders a yellow box of size 92x120 starting at (49, 133).
; PLAN: r0=49(x), r1=133(y), r2=92(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 133
LDI r2, 92
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
