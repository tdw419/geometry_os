; DESCRIPTION: Composite: Places a magenta line segment connecting (350, 77) to (27, 73) then Places a blue dot at position (140, 183).
; PLAN: r0=350(x1), r1=77(y1), r2=27(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=183(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 77
LDI r2, 27
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 183
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
