; DESCRIPTION: Composite: Places a magenta line segment connecting (290, 174) to (116, 183) then Places a white dot at position (245, 173).
; PLAN: r0=290(x1), r1=174(y1), r2=116(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=173(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 290
LDI r1, 174
LDI r2, 116
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 173
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
