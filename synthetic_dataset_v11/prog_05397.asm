; DESCRIPTION: Renders a black box of size 61x34 starting at (92, 112).
; PLAN: r0=92(x), r1=112(y), r2=61(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 112
LDI r2, 61
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
