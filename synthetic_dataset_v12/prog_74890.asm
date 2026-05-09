; DESCRIPTION: Composite: Renders a green box of size 35x49 starting at (169, 41) then Sets a single black pixel at (78, 153).
; PLAN: r0=169(x), r1=41(y), r2=35(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=153(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 41
LDI r2, 35
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 153
LDI r7, 0x000000
PSET r5, r6, r7
HALT
