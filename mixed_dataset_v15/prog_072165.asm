; DESCRIPTION: Composite: Places a blue dot at position (503, 179) then Draws a black line from (420, 0) to (184, 177).
; PLAN: r0=503(x), r1=179(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=420(x1), r6=0(y1), r7=184(x2), r8=177(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 503
LDI r1, 179
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 0
LDI r7, 184
LDI r8, 177
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
