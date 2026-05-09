; DESCRIPTION: Composite: Sets a single black pixel at (234, 202) then Renders a blue box of size 14x111 starting at (437, 61).
; PLAN: r0=234(x), r1=202(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=437(x), r6=61(y), r7=14(width), r8=111(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 202
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 437
LDI r6, 61
LDI r7, 14
LDI r8, 111
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
