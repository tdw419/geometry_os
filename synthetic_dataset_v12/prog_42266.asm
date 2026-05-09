; DESCRIPTION: Composite: Places a yellow line segment connecting (286, 188) to (106, 69) then Places a white dot at position (178, 157).
; PLAN: r0=286(x1), r1=188(y1), r2=106(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=157(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 188
LDI r2, 106
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 157
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
