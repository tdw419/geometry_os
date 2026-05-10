; DESCRIPTION: Composite: Places a black dot at position (422, 49) then Draws a cyan line from (15, 252) to (237, 236).
; PLAN: r0=422(x), r1=49(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=15(x1), r6=252(y1), r7=237(x2), r8=236(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 49
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 15
LDI r6, 252
LDI r7, 237
LDI r8, 236
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
