; DESCRIPTION: Composite: Sets a single green pixel at (272, 12) then Places a magenta line segment connecting (95, 189) to (280, 133).
; PLAN: r0=272(x), r1=12(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=95(x1), r6=189(y1), r7=280(x2), r8=133(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 12
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 95
LDI r6, 189
LDI r7, 280
LDI r8, 133
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
