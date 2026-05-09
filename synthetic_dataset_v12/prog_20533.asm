; DESCRIPTION: Composite: Sets a single orange pixel at (272, 245) then Places a green line segment connecting (96, 188) to (113, 44).
; PLAN: r0=272(x), r1=245(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=96(x1), r6=188(y1), r7=113(x2), r8=44(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 245
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 96
LDI r6, 188
LDI r7, 113
LDI r8, 44
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
