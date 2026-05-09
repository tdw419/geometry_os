; DESCRIPTION: Composite: Places a black dot at position (180, 215) then Draws a cyan line from (338, 147) to (164, 0).
; PLAN: r0=180(x), r1=215(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=338(x1), r6=147(y1), r7=164(x2), r8=0(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 215
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 338
LDI r6, 147
LDI r7, 164
LDI r8, 0
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
