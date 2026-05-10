; DESCRIPTION: Composite: Sets a single blue pixel at (127, 225) then Renders a yellow box of size 107x89 starting at (271, 43).
; PLAN: r0=127(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=271(x), r6=43(y), r7=107(width), r8=89(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 225
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 271
LDI r6, 43
LDI r7, 107
LDI r8, 89
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
