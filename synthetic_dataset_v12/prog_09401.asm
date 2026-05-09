; DESCRIPTION: Composite: Sets a single green pixel at (152, 28) then Renders a magenta line between points (100, 134) and (497, 136).
; PLAN: r0=152(x), r1=28(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=100(x1), r6=134(y1), r7=497(x2), r8=136(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 28
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 100
LDI r6, 134
LDI r7, 497
LDI r8, 136
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
