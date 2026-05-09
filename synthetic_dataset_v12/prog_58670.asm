; DESCRIPTION: Composite: Sets a single purple pixel at (206, 206) then Draws a blue line from (204, 43) to (297, 89).
; PLAN: r0=206(x), r1=206(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=43(y1), r7=297(x2), r8=89(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 206
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 43
LDI r7, 297
LDI r8, 89
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
