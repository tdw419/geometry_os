; DESCRIPTION: Renders a purple box of size 102x111 starting at (92, 22).
; PLAN: r0=92(x), r1=22(y), r2=102(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 22
LDI r2, 102
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
