; DESCRIPTION: Composite: Places a red line segment connecting (178, 153) to (369, 239) then Places a orange dot at position (267, 144).
; PLAN: r0=178(x1), r1=153(y1), r2=369(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=144(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 153
LDI r2, 369
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 144
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
