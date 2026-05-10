; DESCRIPTION: Composite: Places a green dot at position (146, 190) then Renders a white line between points (400, 4) and (424, 188).
; PLAN: r0=146(x), r1=190(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=400(x1), r6=4(y1), r7=424(x2), r8=188(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 190
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 400
LDI r6, 4
LDI r7, 424
LDI r8, 188
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
