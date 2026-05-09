; DESCRIPTION: Renders a black box of size 92x98 starting at (92, 105).
; PLAN: r0=92(x), r1=105(y), r2=92(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 105
LDI r2, 92
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
