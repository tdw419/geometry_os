; DESCRIPTION: Renders a black box of size 92x116 starting at (23, 138).
; PLAN: r0=23(x), r1=138(y), r2=92(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 138
LDI r2, 92
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
