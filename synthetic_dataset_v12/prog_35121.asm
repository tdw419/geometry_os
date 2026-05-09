; DESCRIPTION: Renders a purple box of size 92x91 starting at (336, 142).
; PLAN: r0=336(x), r1=142(y), r2=92(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 142
LDI r2, 92
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
