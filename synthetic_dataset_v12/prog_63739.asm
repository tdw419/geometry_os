; DESCRIPTION: Renders a yellow box of size 92x102 starting at (260, 28).
; PLAN: r0=260(x), r1=28(y), r2=92(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 28
LDI r2, 92
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
