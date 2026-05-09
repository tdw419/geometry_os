; DESCRIPTION: Renders a black box of size 92x48 starting at (49, 90).
; PLAN: r0=49(x), r1=90(y), r2=92(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 90
LDI r2, 92
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
