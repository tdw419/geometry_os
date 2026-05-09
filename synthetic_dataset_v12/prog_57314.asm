; DESCRIPTION: Renders a magenta line between points (351, 91) and (178, 174).
; PLAN: r0=351(x1), r1=91(y1), r2=178(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 91
LDI r2, 178
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
