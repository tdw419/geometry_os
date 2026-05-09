; DESCRIPTION: Renders a black box of size 45x71 starting at (65, 102).
; PLAN: r0=65(x), r1=102(y), r2=45(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 102
LDI r2, 45
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
