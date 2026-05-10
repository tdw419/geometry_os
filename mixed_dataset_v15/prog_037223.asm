; DESCRIPTION: Composite: Places a white dot at position (212, 49) then Draws a green line from (417, 188) to (333, 47).
; PLAN: r0=212(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=417(x1), r6=188(y1), r7=333(x2), r8=47(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 49
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 417
LDI r6, 188
LDI r7, 333
LDI r8, 47
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
