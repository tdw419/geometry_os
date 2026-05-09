; DESCRIPTION: Composite: Places a green dot at position (66, 80) then Draws a cyan line from (176, 58) to (136, 221).
; PLAN: r0=66(x), r1=80(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=176(x1), r6=58(y1), r7=136(x2), r8=221(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 80
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 176
LDI r6, 58
LDI r7, 136
LDI r8, 221
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
