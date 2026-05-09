; DESCRIPTION: Composite: Sets a single cyan pixel at (82, 86) then Draws a yellow line from (355, 53) to (105, 104).
; PLAN: r0=82(x), r1=86(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=355(x1), r6=53(y1), r7=105(x2), r8=104(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 86
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 355
LDI r6, 53
LDI r7, 105
LDI r8, 104
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
