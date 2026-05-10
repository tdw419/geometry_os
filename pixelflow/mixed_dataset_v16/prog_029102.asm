; DESCRIPTION: Composite: Places a blue dot at position (343, 220) then Draws a green line from (230, 132) to (258, 135).
; PLAN: r0=343(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=230(x1), r6=132(y1), r7=258(x2), r8=135(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 220
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 132
LDI r7, 258
LDI r8, 135
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
