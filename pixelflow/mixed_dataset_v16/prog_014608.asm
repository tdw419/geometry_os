; DESCRIPTION: Composite: Places a orange dot at position (338, 183) then Places a red line segment connecting (393, 197) to (197, 146).
; PLAN: r0=338(x), r1=183(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=393(x1), r6=197(y1), r7=197(x2), r8=146(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 183
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 393
LDI r6, 197
LDI r7, 197
LDI r8, 146
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
