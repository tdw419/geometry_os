; DESCRIPTION: Composite: Places a red dot at position (270, 174) then Places a magenta line segment connecting (100, 181) to (382, 188).
; PLAN: r0=270(x), r1=174(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=100(x1), r6=181(y1), r7=382(x2), r8=188(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 174
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 100
LDI r6, 181
LDI r7, 382
LDI r8, 188
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
