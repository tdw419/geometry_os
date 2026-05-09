; DESCRIPTION: Composite: Renders a blue box of size 45x92 starting at (44, 161) then Sets a single black pixel at (424, 235).
; PLAN: r0=44(x), r1=161(y), r2=45(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=235(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 44
LDI r1, 161
LDI r2, 45
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 235
LDI r7, 0x000000
PSET r5, r6, r7
HALT
