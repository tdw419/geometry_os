; DESCRIPTION: Renders a black box of size 47x92 starting at (65, 11).
; PLAN: r0=65(x), r1=11(y), r2=47(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 11
LDI r2, 47
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
