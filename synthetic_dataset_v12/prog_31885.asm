; DESCRIPTION: Composite: Places a orange circle of radius 50 at center (195, 146) then Draws a magenta line from (174, 89) to (353, 107).
; PLAN: r0=195(x), r1=146(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x1), r6=89(y1), r7=353(x2), r8=107(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 146
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 89
LDI r7, 353
LDI r8, 107
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
