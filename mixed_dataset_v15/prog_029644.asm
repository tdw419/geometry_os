; DESCRIPTION: Composite: Sets a single red pixel at (197, 146) then Places a green line segment connecting (152, 252) to (428, 243).
; PLAN: r0=197(x), r1=146(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=152(x1), r6=252(y1), r7=428(x2), r8=243(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 146
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 152
LDI r6, 252
LDI r7, 428
LDI r8, 243
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
