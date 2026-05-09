; DESCRIPTION: Composite: Sets a single blue pixel at (451, 73) then Places a yellow 111x59 rectangle at position (378, 140).
; PLAN: r0=451(x), r1=73(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=140(y), r7=111(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 73
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 140
LDI r7, 111
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
