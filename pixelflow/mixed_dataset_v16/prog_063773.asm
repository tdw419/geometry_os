; DESCRIPTION: Composite: Places a black dot at position (413, 123) then Renders a blue box of size 107x51 starting at (395, 63).
; PLAN: r0=413(x), r1=123(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=63(y), r7=107(width), r8=51(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 123
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 395
LDI r6, 63
LDI r7, 107
LDI r8, 51
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
