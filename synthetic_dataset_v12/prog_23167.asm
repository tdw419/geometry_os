; DESCRIPTION: Composite: Creates a orange circular shape at (358, 103) with radius 27 then Draws a magenta line from (134, 23) to (408, 150).
; PLAN: r0=358(x), r1=103(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x1), r6=23(y1), r7=408(x2), r8=150(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 103
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 23
LDI r7, 408
LDI r8, 150
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
