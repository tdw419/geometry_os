; DESCRIPTION: Composite: Sets a single blue pixel at (343, 166) then Draws a white line from (0, 162) to (307, 180).
; PLAN: r0=343(x), r1=166(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=0(x1), r6=162(y1), r7=307(x2), r8=180(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 166
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 0
LDI r6, 162
LDI r7, 307
LDI r8, 180
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
