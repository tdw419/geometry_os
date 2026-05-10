; DESCRIPTION: Composite: Sets a single green pixel at (168, 132) then Renders a orange line between points (235, 50) and (328, 205).
; PLAN: r0=168(x), r1=132(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=235(x1), r6=50(y1), r7=328(x2), r8=205(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 132
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 235
LDI r6, 50
LDI r7, 328
LDI r8, 205
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
