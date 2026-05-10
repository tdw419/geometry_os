; DESCRIPTION: Composite: Sets a single black pixel at (313, 171) then Renders a blue box of size 76x119 starting at (317, 53).
; PLAN: r0=313(x), r1=171(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=53(y), r7=76(width), r8=119(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 171
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 317
LDI r6, 53
LDI r7, 76
LDI r8, 119
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
