; DESCRIPTION: Composite: Sets a single blue pixel at (180, 144) then Renders a yellow line between points (376, 195) and (493, 166).
; PLAN: r0=180(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=376(x1), r6=195(y1), r7=493(x2), r8=166(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 144
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 195
LDI r7, 493
LDI r8, 166
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
