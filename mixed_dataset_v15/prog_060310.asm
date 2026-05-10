; DESCRIPTION: Composite: Renders a cyan box of size 90x41 starting at (112, 150) then Sets a single black pixel at (94, 49).
; PLAN: r0=112(x), r1=150(y), r2=90(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=49(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 112
LDI r1, 150
LDI r2, 90
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 49
LDI r7, 0x000000
PSET r5, r6, r7
HALT
