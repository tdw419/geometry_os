; DESCRIPTION: Composite: Sets a single purple pixel at (150, 86) then Draws a red line from (458, 244) to (211, 134).
; PLAN: r0=150(x), r1=86(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=458(x1), r6=244(y1), r7=211(x2), r8=134(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 86
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 458
LDI r6, 244
LDI r7, 211
LDI r8, 134
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
