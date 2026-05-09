; DESCRIPTION: Composite: Sets a single blue pixel at (304, 35) then Draws a magenta line from (32, 209) to (414, 139).
; PLAN: r0=304(x), r1=35(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=32(x1), r6=209(y1), r7=414(x2), r8=139(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 35
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 32
LDI r6, 209
LDI r7, 414
LDI r8, 139
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
