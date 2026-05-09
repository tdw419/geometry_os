; DESCRIPTION: Composite: Places a magenta dot at position (260, 165) then Draws a cyan line from (297, 201) to (290, 178).
; PLAN: r0=260(x), r1=165(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=297(x1), r6=201(y1), r7=290(x2), r8=178(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 165
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 297
LDI r6, 201
LDI r7, 290
LDI r8, 178
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
