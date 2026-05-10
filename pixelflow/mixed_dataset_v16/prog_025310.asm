; DESCRIPTION: Composite: Places a black dot at position (422, 104) then Draws a magenta line from (361, 73) to (459, 111).
; PLAN: r0=422(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=361(x1), r6=73(y1), r7=459(x2), r8=111(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 104
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 361
LDI r6, 73
LDI r7, 459
LDI r8, 111
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
