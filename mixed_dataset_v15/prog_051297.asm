; DESCRIPTION: Composite: Places a green dot at position (181, 215) then Renders a green line between points (30, 104) and (434, 229).
; PLAN: r0=181(x), r1=215(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=30(x1), r6=104(y1), r7=434(x2), r8=229(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 215
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 30
LDI r6, 104
LDI r7, 434
LDI r8, 229
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
