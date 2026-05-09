; DESCRIPTION: Composite: Places a magenta line segment connecting (286, 73) to (115, 54) then Places a orange dot at position (165, 111).
; PLAN: r0=286(x1), r1=73(y1), r2=115(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=111(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 73
LDI r2, 115
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 111
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
