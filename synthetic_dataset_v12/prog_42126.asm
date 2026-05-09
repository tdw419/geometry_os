; DESCRIPTION: Composite: Places a yellow dot at position (303, 106) then Draws a green line from (370, 10) to (79, 3).
; PLAN: r0=303(x), r1=106(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=370(x1), r6=10(y1), r7=79(x2), r8=3(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 106
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 370
LDI r6, 10
LDI r7, 79
LDI r8, 3
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
