; DESCRIPTION: Composite: Places a blue dot at position (404, 76) then Renders a magenta line between points (347, 210) and (312, 240).
; PLAN: r0=404(x), r1=76(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=347(x1), r6=210(y1), r7=312(x2), r8=240(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 76
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 347
LDI r6, 210
LDI r7, 312
LDI r8, 240
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
